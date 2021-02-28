from flask import Flask, render_template, redirect, request, session, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
import os
import math
from datetime import datetime

with open("config.json", 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = "super-secret-key"
app.config['upload_folder'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.String(12), nullable=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    phone_num = db.Column(db.String(50), nullable=False)
    message = db.Column(db.String(1200), nullable=False)


class Post(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    subtitle = db.Column(db.String(21), nullable=True)
    image = db.Column(db.String(12), nullable=True)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    author = db.Column(db.String(21), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no-of-post']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no-of-post']):(page-1)*int(params['no-of-post'])+int(params['no-of-post'])]
    # Pagination
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page+1)
    elif page == last:
        prev = "/?page=" + str(page-1)
        next = "#"
    else:
        prev = "/?page=" + str(page-1)
        next = "/?page=" + str(page+1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route("/post/<string:post_slug>", methods=['GET', 'POST'])
def post_route(post_slug):
    posts = Post.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, posts=posts)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone-num')
        message = request.form.get('message')
        entry = Contact(name=name, email=email, phone_num=phone_num, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        # #for sending email
        # mail.send_message('New message From: ' + name,
        #                   sender=email,
        #                   recipients=[params['gmail-user']],
        #                   body=message + "\nFROM " + name + "\n" + phone_num
        #                   )
        flash("Thanks for your time. We will contact you soon !!!", "sucess")
    return render_template('contact.html', params=params)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Post.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('password')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session ['user']=0
            session['user'] = username
            posts = Post.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    
    return render_template('login.html', params=params)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>")
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            title = request.form.get('title')
            subtitle = request.form.get('subtitle')
            image = request.form.get('image')
            slug = request.form.get('slug')
            author = request.form.get('author')
            content = request.form.get('content')

            if sno == 0:
                post = Post(title=title, subtitle=subtitle, image=image, slug=slug, author=author, content=content, date=datetime.now())
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(sno=sno).first()
                post.title = title
                post.subtitle = subtitle
                post.image = image
                post.slug = slug
                post.author = author
                post.content = content
        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)

@app.route("/uploader", methods=['GET', 'POST'])
def upload():
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            f = request.files['file']
            f.save(os.path.join(app.config['upload_folder'],secure_filename(f.filename)))
            return "Upload Sucessfull"

app.run(debug=True)
