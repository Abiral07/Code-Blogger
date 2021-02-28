-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2021 at 05:13 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeblogger`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `date`, `name`, `email`, `phone_num`, `message`) VALUES
(1, '0000-00-00', 'Abiral Khadka', 'myemail@gmail.com', '+977 9886325296', 'this is a first meassage created for testing'),
(3, '2020-07-09', 'dc', 'bistrahul3@gmail.com', '55558656', 'asdsdsasass'),
(4, '2020-07-09', 'pytorch', 'bistrahul3@gmail.com', '55558656', 'ewrewfefefef'),
(5, '2020-07-09', 'pytorch', 'bistrahul3@gmail.com', '55558656', 'ewrewfefefef'),
(6, '2020-07-09', 'pytorch', 'bistrahul3@gmail.com', '55558656', 'ewrewfefefef'),
(7, '2020-07-09', '', '', '', ''),
(8, '2020-07-09', 'rahul', 'kan074bct004@student.kec.edu.np', '55558656', 'sending message'),
(9, '2020-07-09', 'rahul', 'kan074bct004@student.kec.edu.np', '55558656', 'sending message'),
(10, '2020-07-09', 'rahul', 'kan074bct004@student.kec.edu.np', '55558656', 'sending message'),
(11, '2020-07-09', 'rahul', 'bistrahul3@gmail.com', '55558656', 'gc hhhhhf'),
(12, '2020-07-09', 'rahul', 'bistrahul3@gmail.com', '55558656', 'gc hhhhhf'),
(13, '2020-07-09', 'rahul', 'bistrahul3@gmail.com', '55558656', 'gc hhhhhf'),
(14, '2021-02-25', 'Rahul Bist', 'rahul.beest@gmail.com', '9852369872', 'test message'),
(15, '2021-02-25', 'Rahul Bist', 'rahul.beest@gmail.com', '9852369872', 'test message'),
(16, '2021-02-25', 'keshab Bist', 'keshab.beest@gmail.com', '9852369872', 'asxdsadsaddasdadsa'),
(17, '2021-02-25', 'keshab Bist', 'keshab.beest@gmail.com', '9852369872', 'asxdsadsaddasdadsa'),
(18, '2021-02-25', 'keshab Bist', 'keshab.beest@gmail.com', '9852369872', 'asxdsadsaddasdadsa');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `image` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `subtitle`, `image`, `slug`, `content`, `author`, `date`) VALUES
(1, 'PYTHON', 'Learn about Python', 'post-bg.jpg', 'first-post-about-python', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[28]\r\n\r\nPython is dynamically typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented, and functional programming. Python is often described as a \"batteries included\" language due to its comprehensive standard library.[29]\r\n\r\nPython was conceived in the late 1980s as a successor to the ABC language. Python 2.0, released in 2000, introduced features like list comprehensions and a garbage collection system with reference counting.\r\n\r\nPython 3.0, released in 2008, was a major revision of the language that is not completely backward-compatible, and much Python 2 code does not run unmodified on Python 3.\r\n\r\nThe Python 2 language was officially discontinued in 2020 (first planned for 2015), and \"Python 2.7.18 is the last Python 2.7 release and therefore the last Python 2 release.\"[30] No more security patches or other improvements will be released for it.[31][32] With Python 2\'s end-of-life, only Python 3.5.x[33] and later are supported.\r\n\r\nPython interpreters are available for many operating systems. A global community of programmers develops and maintains CPython, an open source[34] reference implementation. A non-profit organization, the Python Software Foundation, manages and directs resources for Python and CPython development.', 'Admin', '2020-09-07'),
(2, 'Isaac Hatch', 'About Isaac Hatch', 'post-bg.jpg', 'Isaac-Hatch', 'Isaac Hatch (dates unknown) was an English first-class cricketer who was active in the 1780s. He had amateur status and played for Kent. He was recorded playing for Kent against White Conduit Club at White Conduit Fields in June 1786, scoring 0 and 7.[1][2]\r\n\r\nAs Hatch had established his reputation by 1786, he must have been active for some years previously. Very few players were mentioned by name in contemporary reports and there are no other references to Hatch.', 'Start Bootstrap', '2020-07-10'),
(3, 'Khulna Division', 'About Khulna Division', 'post-bg.jpg', 'Khulna-Division', 'Khulna Division (Bengali: খুলনা বিভাগ) is one of the eight divisions of Bangladesh. It has an area of 22,285 km2 (8,604 sq mi) and a population of 15,563,000 at the 2011 Census (preliminary returns). Its headquarters & Largest city is Khulna city in Khulna District.\r\n\r\nGeography\r\nThe Khulna division borders the North 24 Parganas district and South 24 Parganas district of West Bengal to the west, the Rajshahi Division to the north, the Dhaka division and the Barisal division to the east, and has a coastline on the Bay of Bengal to the south. It is part of the Ganges River delta or Greater Bengal Delta. Other rivers include the Madhumati River, the Bhairab River and the Kopotokkho River. The region also includes several islands in the Bay of Bengal.', 'Wikipedia', '2019-07-10'),
(4, 'Hamilton County Courthouse (Illinois)', 'About Hamilton Country Courthouse', 'post-bg.jpg', 'Hamilton-County-Courthouse', 'The Hamilton County Courthouse is a government building in McLeansboro, the county seat of Hamilton County, Illinois, United States. Built in 1938, more than forty years after the destruction of the previous courthouse in McLeansboro, it is the third such building to serve the county.\r\n\r\nLand was first registered in Hamilton County in 1815,[1]:252 and the law establishing the county was enacted in early 1821.[1]:258 Local officials soon began working to choose a location as the county seat, and they ultimately approved a piece of land donated by one William McLean, for whom the future city was named.[1]:275 Here was built an early courthouse, a log cabin completed by mid-1821.[1]:277 This building remained in use until the completion of a brick replacement in 1840; it remained in use until an 1894 fire. For nearly half a century, the county operated without a courthouse: the public square housed a combined records office and jail, but most county business accomplished in nearby rented buildings. A weak attempt at building a courthouse saw minimal success, so the advent of the Great Depression saw Hamilton County still functioning without a courthouse. This state of affairs concluded in 1938, when a Works Progress Administration team erected the present Art Deco brick building. Entrances are placed in the center of each side, flanked by three or four windows on either left or right.[2]', 'Goodspeed, 1887', '2018-06-05'),
(5, 'The British farthing', 'History of the British farthing', 'post-bg.jpg', 'History-of-the-British-farthing', 'The British farthing (derived from the Old English feorthing, a fourth part)[1] was a British coin worth a quarter of an old penny (​1⁄960 of a pound sterling). It ceased to be struck after 1956 and was demonetised from 1 January 1961.[2]\r\n\r\nThe British farthing is a continuation of the English farthing, struck by English monarchs prior to the Act of Union 1707 which unified the crowns of England and Scotland into the Kingdom of Great Britain. Only pattern farthings were struck under Queen Anne as there was a glut of farthings from previous reigns. The coin was struck intermittently under George I and George II, but by the reign of George III, counterfeits were so prevalent the Royal Mint ceased striking copper coinage after 1775. The next farthings were the first struck by steam power, in 1799 by Matthew Boulton at his Soho Mint under licence. Boulton coined more in 1806, and the Royal Mint resumed production in 1821. The farthing was struck fairly regularly under George IV and William IV. By then it carried a scaled-down version of the penny\'s design, and would continue to mirror the penny and halfpenny until after 1936.\r\n\r\nFarthings were struck in most years of Queen Victoria\'s long reign. The coin continued to be issued in most years of the first half of the 20th century, and in 1937 it finally received its own reverse design, a wren. By the time the coin bore the portrait of Elizabeth II in 1953–1956, inflation had eroded its value. A fall in commercial demand also contributed to its demise.', 'Ananymous', '2020-07-10'),
(6, 'Nepal', 'about nepal', 'post-bg.jpg', 'Nepal', 'Nepal (Nepali: नेपाल [neˈpal]), officially the Federal Democratic Republic of Nepal,[17] is a country in South Asia. It is located mainly in the Himalayas, but also includes parts of the Indo-Gangetic Plain. It is the 49th largest country by population and 93rd largest country by area. It is landlocked, and borders China in the north and India in the south, east and west, while Bangladesh is located within only 27 km (17 mi) of its southeastern tip and Bhutan is separated from it by the Indian state of Sikkim. Nepal has a diverse geography, including fertile plains, subalpine forested hills, and eight of the world\'s ten tallest mountains, including Mount Everest, the highest point on Earth. Kathmandu is the capital and the largest city. Nepal is a multiethnic country with Nepali as the official language.\r\n\r\nThe name \"Nepal\" is first recorded in texts from the Vedic period of the Indian subcontinent, the era in ancient India when Hinduism was founded, the predominant religion of the country. In the middle of the first millennium BCE, Gautama Buddha, the founder of Buddhism, was born in Lumbini in southern Nepal. Parts of northern Nepal were intertwined with the culture of Tibet. The centrally located Kathmandu Valley is intertwined with the culture of Indo-Aryans, and was the seat of the prosperous Newar confederacy known as Nepal Mandala. The Himalayan branch of the ancient Silk Road was dominated by the valley\'s traders. The cosmopolitan region developed distinct traditional art and architecture. By the 18th century, the Gorkha Kingdom achieved the unification of Nepal. The Shah dynasty established the Kingdom of Nepal and later formed an alliance with the British Empire, under its Rana dynasty of premiers. The country was never colonized but served as a buffer state between Imperial China and British India. Parliamentary democracy was introduced in 1951, but was twice suspended by Nepalese monarchs, in 1960 and 2005. The Nepalese Civil War in the 1990s and early 2000s resulted in the establishment of a secular republic in 2008, ending the world\'s last Hindu monarchy.\r\n\r\nThe Constitution of Nepal, adopted in 2015, affirms Nepal as a secular federal parliamentary republic divided into seven provinces. Nepal was admitted to the United Nations in 1955, and friendship treaties were signed with India in 1950 and the People\'s Republic of China in 1960. Nepal hosts the permanent secretariat of the South Asian Association for Regional Cooperation (SAARC), of which it is a founding member. Nepal is also a member of the Non-Aligned Movement and the Bay of Bengal Initiative. The military of Nepal is the fifth largest in South Asia; it is notable for its Gurkha history, particularly during the world wars, and has been a significant contributor to United Nations peacekeeping operations.', 'Abiral Khadka', '2020-07-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
