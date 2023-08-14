CREATE DATABASE  IF NOT EXISTS `inkscribe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inkscribe`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: inkscribe
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `view_count` int DEFAULT '0',
  `type` int DEFAULT NULL,
  `featured_image_url` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_uid` (`user_id`),
  KEY `fk_article_type` (`type`),
  CONSTRAINT `fk_article_type` FOREIGN KEY (`type`) REFERENCES `articles_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (26,2,'ChatGPT: Revolutionizing Conversational AI for Enhanced Interactions','unveiling-chatgpt-transformative-conversational-ai','  **ChatGPT** is a remarkable advancement in the field of artificial intelligence, brought to life by OpenAI. It represents a substantial leap forward in conversational AI, allowing machines to engage in natural and meaningful conversations with users. Let\'s delve into what exactly ChatGPT is and how it\'s transforming the way we interact with technology.\r \r ## What is ChatGPT?\r \r At its core, ChatGPT is a language model that uses a variant of the GPT (Generative Pre-trained Transformer) architecture. This architecture is a type of deep learning model designed to process and generate human-like text. Unlike its predecessors, ChatGPT is fine-tuned specifically for conversational contexts, making it adept at generating coherent and contextually relevant responses in a chat-like format.\r \r ## How does ChatGPT work?\r \r ChatGPT is trained on a massive amount of diverse text data, encompassing a wide range of topics and writing styles. This enables it to learn grammar, syntax, semantics, and even cultural nuances from the text it\'s exposed to. The model\'s \"pre-training\" phase involves predicting the next word in a sentence, which helps it grasp the structures and patterns of human language.\r \r During the \"fine-tuning\" phase, the model is trained on specific conversational datasets. This process refines the model\'s ability to generate appropriate responses in a conversation. Additionally, human reviewers provide feedback and rate possible model outputs for a variety of example inputs, helping the model generalize its responses.\r \r ## Conversational Abilities\r \r ChatGPT\'s impressive conversational abilities stem from its understanding of context. It can maintain context over multiple turns of conversation, recognize user instructions, answer questions, and even exhibit a sense of personality. It can be used for a multitude of applications, including customer support, content generation, idea brainstorming, language translation, and much more.\r \r ## The Power of OpenAI API\r \r OpenAI provides an API that allows developers to integrate ChatGPT into their applications, products, or services. This API empowers businesses and creators to leverage the capabilities of ChatGPT without needing to develop the underlying AI infrastructure from scratch.\r \r ## Ethical Considerations\r \r As with any AI technology, there are ethical considerations when using ChatGPT. While it generates text that often seems human-like, it\'s essential to remember that ChatGPT\'s responses are based on patterns it learned from data and do not possess genuine understanding or consciousness. OpenAI has put efforts into making the technology safer and more responsible, including implementing safety mitigations and seeking feedback from users to address biases and potential misuse.\r \r ## Conclusion\r \r ChatGPT represents a significant advancement in the realm of conversational AI. Its ability to engage in coherent and contextually relevant conversations opens doors to a plethora of innovative applications across various industries. While it\'s a remarkable tool, it\'s crucial to use it responsibly and with an understanding of its capabilities and limitations. As technology continues to evolve, ChatGPT stands as a testament to the potential of AI to enhance human-machine interactions.\r ','2023-08-14 10:57:52',0,7,'https://images.moneycontrol.com/static-mcnews/2023/02/chatgpt-open-AI-rtr-1-770x433.jpg?impolicy=website&width=770&height=431','Discover ChatGPT, OpenAI\'s cutting-edge conversational AI powered by the GPT architecture. From customer support to content generation, ChatGPT\'s context-aware responses redefine human-machine interactions. Explore its capabilities and ethical considerations in AI technology today.'),(27,2,'Social Media: A Boon or a Curse?','social-media-boon-curse','\r In the age of rapid technological advancement, social media has emerged as a powerful force that has transformed the way we communicate, connect, and share information. However, the impact of social media on society is a subject of ongoing debate. Is it a boon that enriches our lives, or a curse that brings about negative consequences? Let\'s explore both sides of the coin.\r \r ## The Boons of Social Media\r \r ### Global Connectivity\r \r Social media platforms have broken down geographical barriers, enabling individuals to connect with friends, family, and even strangers across the world. This has facilitated cultural exchange, knowledge sharing, and the creation of online communities based on shared interests.\r \r ### Information Dissemination\r \r News and information now spread faster than ever, thanks to social media. It has played a crucial role in disseminating breaking news, raising awareness about social issues, and even mobilizing support for charitable causes.\r \r ### Empowerment and Expression\r \r Social media provides a platform for individuals to express their opinions, showcase their talents, and advocate for change. It has given a voice to marginalized communities and empowered individuals to challenge norms and question authority.\r \r ## The Curses of Social Media\r \r ### Addiction and Mental Health\r \r The addictive nature of social media, designed to keep users engaged, has raised concerns about excessive screen time and its impact on mental health. Cyberbullying, social comparison, and the curated reality portrayed on these platforms can contribute to feelings of inadequacy and anxiety.\r \r ### Spread of Misinformation\r \r The rapid sharing of information on social media can lead to the spread of misinformation and fake news. This poses significant challenges for discerning accurate information from misleading content, potentially influencing public opinion and decisions.\r \r ### Privacy and Security Concerns\r \r Personal data privacy has become a major concern, as social media platforms collect vast amounts of user data. Instances of data breaches and unauthorized access raise questions about the security of sensitive information.\r \r ## Striking a Balance\r \r While the debate between the benefits and drawbacks of social media continues, it\'s important to recognize that its impact is nuanced and multifaceted. Rather than labeling it solely as a boon or a curse, it\'s essential to consider how we use social media and its potential to shape society.\r \r Educating individuals about responsible online behavior, digital literacy, and critical thinking can empower users to make informed choices while navigating the digital landscape. Additionally, efforts by social media companies to enhance user privacy, curb misinformation, and promote positive interactions can contribute to a healthier online environment.\r \r In conclusion, social media\'s influence on society is a complex interplay of positive and negative aspects. By fostering a balanced and conscious approach to its usage, we can harness its potential as a powerful tool for connection, expression, and positive change, while mitigating its associated challenges.','2023-08-14 11:05:23',0,10,'https://blogs.dpuerp.in/images/blog/52/88-social-media-a-boon-or-a-curse.jpg','Explore the multifaceted impact of social media in today\'s world. Delve into its benefits, challenges, and the ongoing debate about its role as a force for good or a source of concerns.'),(28,3,'Unveiling the Dance of Laziness and Procrastination: Allies or Adversaries?','laziness-procrastination','In the labyrinth of our modern lives, laziness and procrastination often sneak in as uninvited guests, disrupting our plans and goals. While they might seem like two sides of the same coin, a closer look reveals their distinct nature and the complex relationship they share. Let\'s delve into the intriguing dance of laziness and procrastination, deciphering whether they are allies or adversaries.\r\n\r\n## The Enigma of Laziness\r\n\r\nLaziness, often misunderstood, can be a natural response to fatigue, overexertion, or burnout. It serves as a signal from our body and mind, urging us to pause, rest, and rejuvenate. However, when embraced as a perpetual state, laziness transforms into a hindrance, thwarting progress and potential.\r\n\r\n## The Temptation of Procrastination\r\n\r\nProcrastination, on the other hand, is the art of postponing tasks, often in favor of short-term pleasures or the illusion of more favorable circumstances in the future. It can stem from fear of failure, lack of motivation, or simply the allure of immediate gratification. While procrastination may provide fleeting comfort, it ultimately hinders growth and achievement.\r\n\r\n## Allies in Distraction\r\n\r\nLaziness and procrastination can sometimes join forces in the realm of distractions. The availability of social media, streaming platforms, and endless online content provides an escape from responsibilities. Engaging in these distractions under the guise of rest can lead to a cycle of procrastination fueled by laziness, where time slips away, and tasks remain untouched.\r\n\r\n## Adversaries in Progress\r\n\r\nWhile laziness might offer temporary relief, and procrastination might promise the luxury of delay, they stand as adversaries when it comes to realizing our ambitions. The dreams we chase, the goals we set, and the accomplishments we aspire to achieve are often held hostage by these forces. Their alliance can create a perfect storm of missed opportunities and unfulfilled potential.\r\n\r\n## Navigating the Balance\r\n\r\nAcknowledging the distinction between laziness and procrastination is key to understanding their role in our lives. Harnessing laziness as a signal for self-care and mindful rest can prevent it from evolving into chronic inertia. Addressing procrastination requires confronting the underlying fears and uncertainties that breed it, allowing us to break free from its grasp.\r\n\r\n## Transformation and Empowerment\r\n\r\nRecognizing laziness and procrastination as transient experiences rather than permanent states empowers us to transform them. Channeling the energy of laziness into rejuvenation and embracing accountability can break the cycle of procrastination. Cultivating habits of discipline, setting realistic goals, and seeking support from others can shift the balance towards productivity and achievement.\r\n\r\nIn the end, the dance of laziness and procrastination is a nuanced one, where understanding their dynamics can lead to a harmonious rhythm of productivity and well-being. By recognizing their signals, making conscious choices, and taking intentional actions, we can shape a narrative where these forces become stepping stones to growth rather than stumbling blocks.','2023-08-14 11:14:50',0,9,'https://www.teamly.com/blog/wp-content/uploads/2021/11/Benefits-of-procrastination.png','Explore the intricate relationship between laziness and procrastination. Discover how understanding their dynamics can lead to productivity, growth, and a harmonious balance in our lives.'),(30,7,'Navigating the Complex Landscape of Politics: Power, Policies, and Perspectives','complex-landscape-politics','Politics, the intricate art of governance and decision-making, shapes the very fabric of our societies. From local communities to global arenas, politics weaves a complex tapestry that defines the rules, principles, and aspirations we live by. In this exploration, we delve into the multifaceted realm of politics, uncovering its dynamics, significance, and the challenges it presents.\r\n\r\n## The Essence of Politics\r\n\r\nAt its core, politics revolves around the distribution and exercise of power. It encompasses the creation and implementation of policies that impact various aspects of human life - from education and healthcare to economy and the environment. As a social endeavor, politics reflects the diverse values, beliefs, and interests of a society\'s constituents.\r\n\r\n## The Power Play\r\n\r\nPower is the driving force in politics, often concentrated in the hands of elected officials, government bodies, and institutions. The quest for power can lead to competition, negotiation, and compromise. The decisions made by those in power have far-reaching consequences, influencing the lives of individuals, communities, and nations.\r\n\r\n## Policies that Shape Societies\r\n\r\nPolicies are the tangible outcomes of political decisions. They outline how resources are allocated, services are provided, and rights are protected. Policy-making requires a delicate balance between addressing current needs and anticipating future challenges. Effective policies are grounded in evidence, inclusivity, and the pursuit of the greater good.\r\n\r\n## The Spectrum of Perspectives\r\n\r\nPolitical landscapes are rich with diversity, encompassing a wide range of ideologies, beliefs, and opinions. Political parties and movements advocate for distinct visions of how society should be governed. Debates and discussions on topics like social justice, economic equality, and environmental sustainability are essential in shaping policies that reflect the needs and desires of the people.\r\n\r\n## Challenges on the Horizon\r\n\r\nWhile politics holds the potential for positive change, it is not without its challenges. Polarization, misinformation, and the influence of special interests can hinder the democratic process. Inequities in representation and access to decision-making can amplify the voices of some while marginalizing others. Striking a balance between competing interests and maintaining ethical governance remains a persistent challenge.\r\n\r\n## Empowerment through Participation\r\n\r\nActive citizen engagement is fundamental to a thriving political system. By participating in elections, voicing concerns, and advocating for change, individuals can influence policy decisions and hold leaders accountable. Grassroots movements, social media activism, and civil society organizations play vital roles in amplifying voices and driving change.\r\n\r\n## A Call to Civic Responsibility\r\n\r\nIn a world interconnected by technology and global challenges, politics transcends borders. Climate change, public health, and human rights are issues that require international cooperation. Being informed, critical thinkers and responsible participants in the political process are essential to addressing these complex challenges.\r\n\r\n## Conclusion\r\n\r\nPolitics, with its interplay of power, policies, and diverse perspectives, is a force that shapes the course of societies. While it presents challenges, it also offers opportunities for progress, change, and collective well-being. By understanding its intricacies, engaging in meaningful discourse, and actively participating, we contribute to a more just, equitable, and informed world.','2023-08-14 11:22:35',0,1,'https://www.voicesofyouth.org/sites/voy/files/styles/big_blog_teaser/public/images/2019-01/politics3.jpg?itok=WpZLqAeP','Explore the multifaceted realm of politics, from the dynamics of power and policy-making to the diverse range of perspectives that shape societies. Discover the challenges, significance, and ways individuals can engage in the political process.'),(31,5,'The Write Stuff: Unleashing Chuckles and Characters','write-stuff-unleashing-chuckles','Ah, the art of writing. It\'s like trying to tame a whirlwind of ideas, a whirlwind that sometimes decides to take a coffee break right when you need it most. So grab your pens, laptops, or quills (if you\'re feeling particularly old-school), and let\'s dive into the wacky world of writing â a place where typos become accidental comedians, and writer\'s block can feel like a staring contest with a blank page.\r\n\r\n## The Battle of the Typos\r\n\r\nTypos, those sneaky little devils that infiltrate your work just when you\'re about to hit \"send.\" You\'ve proofread a hundred times, and yet there it is â the dreaded \"pubic\" instead of \"public.\" Suddenly, your serious email becomes a giggle-inducing adventure. Hey, at least your readers won\'t forget it anytime soon!\r\n\r\n## The Mysteries of Inspiration\r\n\r\nAh, inspiration â that elusive muse that shows up at the most inconvenient times. You\'re in the shower, and the next Pulitzer-worthy sentence forms in your mind. By the time you dry off and grab a pen, it\'s vanished like a mirage in the desert. Maybe inspiration prefers steamy environments?\r\n\r\n## The Quirks of Dialogue\r\n\r\nWriting dialogue is like juggling flaming marshmallows â it\'s fun until something goes up in flames. Your characters, meant to sound suave and sophisticated, suddenly channel their inner Shakespeare and start speaking in iambic pentameter. \"To tweet or not to tweet, that is the question.\"\r\n\r\n## The Infamous Writer\'s Block\r\n\r\nWriter\'s block â the heavyweight champion of creative frustration. You stare at the screen, the cursor mocking your inability to conjure coherent thoughts. You contemplate a career change to potato farming. Suddenly, you remember that one time you wrote an entire essay on \"The Greatness of Potatoes.\" Is this a sign?\r\n\r\n## The Hidden World of Research\r\n\r\nAh, research â the rabbit hole that leads to information you never knew you needed. You start researching penguins for your children\'s story and end up reading about quantum physics. Somehow, you\'re convinced penguins are interdimensional travelers. Your editor might not agree.\r\n\r\n## Conclusion: Inky Laughs and Keyboard Adventures\r\n\r\nSo, fellow writers, whether you\'re crafting novels, emails, or those hilarious passive-aggressive notes to your roommate about doing the dishes, remember that writing is a journey filled with chuckles, characters, and a splash of chaos. Embrace the quirks, find humor in the hiccups, and let your words dance on the page â even if they occasionally trip over their own feet.\r\n\r\nAnd remember, if all else fails, you can always write a funny article about writing. Just make sure the typos play nice this time!','2023-08-14 11:26:56',0,2,'https://cdn.telanganatoday.com/wp-content/uploads/2021/05/writing-skills.jpg','Embark on a humorous journey into the world of writing, where typos become accidental comedians, writer\'s block battles your creativity, and characters surprise you with their quirks. Explore the fun and challenges of the writer\'s life!'),(32,5,'Cracking the Code: Programming with a Side of Chuckles','cracking-the-code-programming-fun','Hey there, code wranglers and pixel pushers! Ready to dive into the wild and wacky world of programming? Buckle up, because we\'re about to embark on a journey through lines of code, bug hunts, and the ever-present struggle of making a computer do your bidding. Grab your favorite energy drink and let\'s get coding with a side of chuckles!\r\n\r\n## The Language of Machines... and Misunderstandings\r\n\r\nProgramming languages are like your best friend\'s pet parrot â they only understand a specific set of words. But sometimes, instead of giving you the information you need, they\'ll just squawk and fly away. You thought you said, \"Please fetch the data,\" but the parrot hears, \"Echo, echo, squawk!\" Ah, the joys of syntax errors!\r\n\r\n## The Quest for the Mighty Bug\r\n\r\nAh, bugs â those tiny creatures that have taken a liking to your code. They\'re the ultimate hide-and-seek champions, vanishing when you\'re ready to squash them. One moment your program\'s running fine, and the next, it\'s throwing a tantrum like a toddler who just dropped their ice cream cone. Time to put on your bug-catching hat and solve the mystery!\r\n\r\n## Loop-de-Loops and Logic Leaps\r\n\r\nLoops are like the endless playlists you create â they repeat, repeat, and repeat until you decide to move on. And speaking of logic, programming is a bit like navigating a labyrinth. If your logic takes a wrong turn, you might end up with a program that thinks the sky is made of cheese. Spoiler alert: it\'s not.\r\n\r\n## Comments: Leaving Notes for Future You\r\n\r\nEver written a program and returned to it later, wondering what on earth you were thinking? That\'s where comments come in â your virtual sticky notes for future-you. \"Dear Future-Me, I know this code seems genius now, but trust me, you\'ll want to rethink that decision. Love, Past-You.\"\r\n\r\n## The Thrill of Problem-Solving\r\n\r\nProgramming is like being a detective in a world of digital mysteries. Every bug you solve is a victory dance waiting to happen. It\'s the euphoria of seeing your code work flawlessly after hours of head-scratching and keyboard-tapping. Sherlock Holmes would be proud!\r\n\r\n## Conclusion: Code and Chuckles\r\n\r\nSo, fellow programmers, as you tango with your text editors and wrestle with your compilers, remember that programming isn\'t just about logic and syntax â it\'s a journey filled with quirks and laughter. Embrace the challenges, celebrate the small victories, and keep that sense of humor close at hand. After all, isn\'t coding just a grand adventure with an occasional glitchy dragon to slay?\r\n\r\nAnd don\'t forget, the next time your code misbehaves, give it a gentle pat and whisper, \"It\'s not you, it\'s me. Let\'s debug together!\"','2023-08-14 11:30:01',0,3,'https://bairesdev.mo.cloudinary.net/blog/2020/10/Top-100-programming-languages.jpg?tx=w_3840,q_auto','Embark on a hilarious journey through the world of programming, where syntax errors become squawking parrots, bugs play hide-and-seek, and logic takes unexpected leaps. Discover the joy of solving digital mysteries and the thrill of turning code into a chuckle-worthy adventure!'),(33,4,'Empowerment Unleashed: The Essence of Feminism','empowerment-unleashed-essence-feminism','In the spotlight of social progress and gender equality, feminism emerges as a beacon of empowerment, challenging norms and advocating for justice. Beyond the buzzwords and debates, let\'s delve into the heart of feminism, exploring its origins, principles, and the diverse paths it forges toward a more equitable world.\r\n\r\n## The Roots of Feminism\r\n\r\nFeminism\'s roots dig deep into history, branching from the quest for women\'s suffrage in the late 19th and early 20th centuries. The movement has since evolved, encompassing issues beyond voting rights to embrace a spectrum of gender-based disparities, including education, employment, and bodily autonomy.\r\n\r\n## Breaking Stereotypes\r\n\r\nFeminism dismantles stereotypes that confine individuals to predetermined roles based on gender. It defies the notion that men must be stoic providers and women passive caretakers. By challenging these norms, feminism opens doors to self-expression and aspirations unbounded by societal expectations.\r\n\r\n## Equality on All Fronts\r\n\r\nAt its core, feminism is a fight for equality â not just gender equality, but also the intersectionality of race, ethnicity, sexuality, and socioeconomic status. The movement advocates for dismantling systems that perpetuate discrimination and amplifying marginalized voices.\r\n\r\n## Navigating Waves of Feminism\r\n\r\nFeminism isn\'t a monolith; it\'s a wave of interconnected movements with varying focuses and strategies. First-wave feminism addressed legal inequalities, second-wave feminism tackled cultural and workplace disparities, and modern feminism, often termed third-wave or intersectional feminism, encompasses a wider array of identities and issues.\r\n\r\n## A Balancing Act\r\n\r\nFeminism doesn\'t seek to diminish the experiences of any gender; it seeks equilibrium. It strives for a world where masculinity isn\'t constrained by stereotypes and femininity isn\'t diminished. Gender roles become fluid, personal, and based on individual preferences rather than societal pressures.\r\n\r\n## Beyond Gender: Allies and Advocates\r\n\r\nFeminism extends an invitation to all who champion equality. Allies and advocates, regardless of gender, contribute to the dismantling of oppressive systems. By standing beside feminists, they acknowledge that a fairer world benefits everyone.\r\n\r\n## Challenges and Progress\r\n\r\nFeminism encounters hurdles â from backlash and misconceptions to the complexities of intersectionality. Nevertheless, its progress is undeniable. Women\'s increased representation in leadership roles, legislative changes, and cultural shifts signal that the world is moving closer to gender parity.\r\n\r\n## A Call to Action\r\n\r\nFeminism isn\'t just a conversation; it\'s a call to action. It\'s about confronting biases, supporting women\'s voices, and demanding justice for all genders. It\'s about teaching the next generation that empowerment knows no bounds.\r\n\r\n## Conclusion: Empowerment for All\r\n\r\nFeminism isn\'t a movement of exclusion; it\'s a journey toward a world where all individuals are free to pursue their passions, regardless of their gender. It recognizes the strength in unity, the power in diversity, and the transformative potential of challenging the status quo. In embracing feminism, we embrace the promise of a brighter and more equitable future for all.','2023-08-14 11:33:52',0,11,'https://bairesdev.mo.cloudinary.net/blog/2020/10/Top-100-programming-languages.jpg?tx=w_3840,q_auto','Delve into the heart of feminism and explore its roots, principles, and its transformative journey towards equality, empowerment, and justice. Discover the impact of feminism on gender dynamics and its role in shaping a more equitable world.');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_type`
--

DROP TABLE IF EXISTS `articles_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'any',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_type`
--

LOCK TABLES `articles_type` WRITE;
/*!40000 ALTER TABLE `articles_type` DISABLE KEYS */;
INSERT INTO `articles_type` VALUES (1,'Politics'),(2,'Writing'),(3,'Programming'),(4,'Data Science'),(5,'Technology'),(6,'Machine Learning'),(7,'ChatGPT'),(8,'GPT-4'),(9,'Productivity'),(10,'Social'),(11,'Empowerment');
/*!40000 ALTER TABLE `articles_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `article_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reactions_article_id` (`article_id`),
  KEY `fk_reactions_user_id` (`user_id`),
  CONSTRAINT `fk_reactions_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reactions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `article_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_article_id` (`article_id`),
  CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bio` longtext,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@inkscribe.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-11 04:42:03','2023-08-11 04:42:03','','1970-01-01'),(2,'Sanmeet Singh','ssanmeet123@gmail.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-11 05:45:22','2023-08-11 05:45:22','Hi there ?','2023-08-17'),(3,'John Smith','john.smith@example.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-14 10:30:23','2023-08-14 10:30:23','Hey there! I\'m John Smith, a tech enthusiast and avid traveler. I believe in exploring the world one byte at a time. With a passion for coding and a love for adventure, I\'m always seeking new challenges to conquer. Let\'s connect and share our experiences!','1990-05-15'),(4,'Michael Williams','michael.williams@example.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-14 10:31:08','2023-08-14 10:31:08','Greetings! I\'m Michael Williams, a fitness enthusiast and nature lover. I find solace in the great outdoors, whether I\'m hiking through forests or hitting the gym. My dedication to health and wellness is matched only by my passion for cooking up nutritious meals that fuel both body and mind.','1995-03-20'),(5,'Emily Johnson','emily.johnson@example.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-14 10:31:46','2023-08-14 10:31:46','Hello! I\'m Emily Johnson, a coffee lover and bookworm. When I\'m not immersed in the latest mystery novel, you\'ll find me trying out new baking recipes in my kitchen. I\'m a firm believer in lifelong learning and enjoy discovering new ways to express creativity.','1988-11-02'),(6,'Christopher Brown','christopher.brown@example.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-14 10:32:41','2023-08-14 10:32:41','Salutations! I\'m Christopher Brown, a music enthusiast and amateur astronomer. Whether I\'m strumming my guitar or gazing at the stars, I find beauty in the harmony of the cosmos. I\'m on a journey to explore the melodies of the universe and create my own along the way.','1992-09-25'),(7,'Sarah Davis','sarah.davis@example.com','40186f55b34fdcec1faee185b40fba58743d1419e1be856f05662ba69b9a9aeb',NULL,'2023-08-14 10:33:51','2023-08-14 10:33:51','Hi, I\'m Sarah Davis, a dedicated art aficionado and animal lover. My canvas is my sanctuary, where I pour my heart and soul into creating vibrant and meaningful artworks. When I\'m not painting, you\'ll find me volunteering at the local animal shelter, spreading smiles one furry friend at a time.','2001-09-05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'inkscribe'
--

--
-- Dumping routines for database 'inkscribe'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_article`(
	  in _user_id int,
	  in _title varchar(255),
	  in _slug varchar(255),
	  in _content text,
	  in _type int,
	  in _featured_image_url varchar(255),
	  in _description text
)
BEGIN
	insert into articles (user_id , title, slug , content, type , featured_image_url , description) 
	values(
	 _user_id, _title ,_slug , _content, _type , _featured_image_url , _description
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dislike_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dislike_article`(
	in aid int,
    in uid int
)
BEGIN
		declare x int;

        start transaction;
            select count(id) into x from reactions where user_id = uid and article_id = aid;
            if x = 0 then 
				insert into reactions (article_id , user_id , type ) values (
					aid, uid, 0
				);
            else 
               update reactions set type = 0
			   where article_id = aid and user_id = uid; 
            end if;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetch_trending_articles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetch_trending_articles`(
	in n int
)
BEGIN
	with likes_dislikes as (select article_id ,
		sum(type) as likes_count , 
		count(type) - sum(type) as dislikes_count
		from reactions 
		group by article_id)
		select 
			t1.id, t1.user_id, t2.name,  t1.title, t1.slug, '' as content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
			t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
			null as myreaction
			from articles t1 
			inner join users t2 on t2.id = t1.user_id
			inner join articles_type t3 on t1.type = t3.id 
			left join likes_dislikes t4 on t4.article_id = t1.id
		    order by t1.view_count desc limit n offset 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_articles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_articles`(
	in _title varchar(255), 
    in _type int 
)
BEGIN
	if _type is not null then 
		with likes_dislikes as (select article_id ,
		sum(type) as likes_count , 
		count(type) - sum(type) as dislikes_count
		from reactions 
		group by article_id)
		select 
			t1.id, t1.user_id, t2.name,  t1.title, t1.slug, '' as content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
			t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
			null as myreaction
			from articles t1 
			inner join users t2 on t2.id = t1.user_id
			inner join articles_type t3 on t1.type = t3.id 
			left join likes_dislikes t4 on t4.article_id = t1.id
		where t1.title like concat("%"  ,_title  , "%") and t1.type = _type order by t1.created_at desc;
	else 
	with likes_dislikes as (select article_id ,
		sum(type) as likes_count , 
		count(type) - sum(type) as dislikes_count
		from reactions 
		group by article_id)
		select 
			t1.id, t1.user_id, t2.name,  t1.title, t1.slug, '' as content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
			t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
			null as myreaction
			from articles t1 
			inner join users t2 on t2.id = t1.user_id
			inner join articles_type t3 on t1.type = t3.id 
			left join likes_dislikes t4 on t4.article_id = t1.id
		where t1.title like concat("%"  ,_title  , "%")   order by t1.created_at desc;
     end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_articles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_articles`()
BEGIN

with likes_dislikes as (select article_id ,
sum(type) as likes_count , 
count(type) - sum(type) as dislikes_count
from reactions 
group by article_id)
select 
	t1.id, t1.user_id, t2.name,  t1.title, t1.slug, '' as content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
    t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
	null as myreaction
	from articles t1 
	inner join users t2 on t2.id = t1.user_id
	inner join articles_type t3 on t1.type = t3.id 
    left join likes_dislikes t4 on t4.article_id = t1.id
    order by t1.created_at desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_articles_by_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_articles_by_user_id`(
	in _uid int
)
BEGIN
	
with likes_dislikes as (select article_id ,
sum(type) as likes_count , 
count(type) - sum(type) as dislikes_count
from reactions 
group by article_id)
select 
	t1.id, t1.user_id, t2.name,  t1.title, t1.slug, '' as content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
    t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
	null as myreaction
	from articles t1 
	inner join users t2 on t2.id = t1.user_id
	inner join articles_type t3 on t1.type = t3.id 
    left join likes_dislikes t4 on t4.article_id = t1.id
    where t1.user_id = _uid  order by t1.created_at desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_article_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_article_comments`(
	in aid int
)
BEGIN
	select t1.id , t2.name, content, t1.article_id, t1.user_id, t1.created_at from responses t1
	inner join users t2 on t1.user_id = t2.id
	where article_id = aid order by t1.created_at desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_article_comments_by_slug` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_article_comments_by_slug`(
	in _slug varchar(255)
)
BEGIN
	select t1.id , t2.name, t1.content, t1.article_id, t1.user_id, t1.created_at from responses t1
	inner join users t2 on t1.user_id = t2.id
    inner join articles t3 on t3.id = t1.article_id
	where t3.slug = _slug order by t1.created_at desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_article_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_article_details`(
	in aid int,
    in uid int 
)
BEGIN

with likes_dislikes as (select article_id ,
sum(type) as likes_count , 
count(type) - sum(type) as dislikes_count
from reactions 
group by article_id)
select 
	t1.id, t1.user_id, t2.name,  t1.title, t1.slug,  t1.content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
    t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
(select type from reactions where user_id = uid and article_id = aid) as myreaction 
	from articles t1 
	inner join users t2 on t2.id = t1.user_id
	inner join articles_type t3 on t1.type = t3.id 
    left join likes_dislikes t4 on t4.article_id = t1.id
	where t1.id = aid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_article_details_by_slug` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_article_details_by_slug`(
	in _slug varchar(255),
    in uid int 
)
BEGIN
	with likes_dislikes as (select article_id ,
sum(type) as likes_count , 
count(type) - sum(type) as dislikes_count
from reactions 
group by article_id)
select 
	t1.id, t1.user_id, t2.name,  t1.title, t1.slug, t1.content,t3.type, t1.created_at, t1.view_count, t1.featured_image_url,
    t1.description, COALESCE(likes_count, 0) as likes, COALESCE(dislikes_count ,0) as dislikes,
    (select type from reactions where user_id = uid and article_id = t1.id) as myreaction 
	from articles t1 
	inner join users t2 on t2.id = t1.user_id
	inner join articles_type t3 on t1.type = t3.id 
    left join likes_dislikes t4 on t4.article_id = t1.id
	where t1.slug = _slug;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `increment_article_vc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `increment_article_vc`(
	in aid int
)
BEGIN
	declare current_vc int;
	select view_count into current_vc from articles where id = aid;
        if current_vc is not null then 
				start transaction;
				   set current_vc = current_vc + 1;
		           update articles set view_count = current_vc where id = aid;
				commit;
        else 
			signal sqlstate "45000" set message_text = "Invalid article id not found";
        end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `like_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `like_article`(
	in aid int,
    in uid int
)
BEGIN
		declare x int;

        start transaction;
            select count(id) into x from reactions where user_id = uid and article_id = aid;
            if x = 0 then 
				insert into reactions (article_id , user_id , type ) values (
					aid, uid, 1
				);
            else 
               update reactions set type = 1
			   where article_id = aid and user_id = uid; 
            end if;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_article_vc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_article_vc`(
	in aid int,
    in vc int
)
BEGIN
				start transaction;
		           update articles set view_count = vc where id = aid;
				commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-14 17:17:01
