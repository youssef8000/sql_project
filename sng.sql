--
-- Database: `sng`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `createdBY` int(11) DEFAULT NULL,
  `updatedBY` int(11) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `metaTitle` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `summary` tinytext DEFAULT NULL,
  `statusG` smallint(6) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profil` text DEFAULT NULL,
  `content` text DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `group_follower`
--

CREATE TABLE `group_follower` (
  `id` int(11) NOT NULL,
  `groupId` int(20) DEFAULT NULL,
  `userID` int(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

CREATE TABLE `group_member` (
  `id` int(11) NOT NULL,
  `userID` int(20) DEFAULT NULL,
  `groupId` int(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `statuses` smallint(6) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `note` text DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `group_message`
--

CREATE TABLE `group_message` (
  `id` int(11) NOT NULL,
  `groupId` int(20) DEFAULT NULL,
  `userID` int(20) DEFAULT NULL,
  `message` tinytext DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `group_meta`
--

CREATE TABLE `group_meta` (
  `id` int(11) NOT NULL,
  `groupID` int(20) DEFAULT NULL,
  `Keyy` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `group_post`
--

CREATE TABLE `group_post` (
  `id` int(11) NOT NULL,
  `groupID` int(20) DEFAULT NULL,
  `userID` int(20) DEFAULT NULL,
  `message` tinytext DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `passwordHash` varchar(32) DEFAULT NULL,
  `registeredAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profiless` text DEFAULT NULL,
  `intro` tinytext DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `user_follower`
--

CREATE TABLE `user_follower` (
  `id` int(11) NOT NULL,
  `sourceID` int(20) DEFAULT NULL,
  `targetId` int(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `user_friend`
--

CREATE TABLE `user_friend` (
  `id` int(11) NOT NULL,
  `sourceID` int(20) DEFAULT NULL,
  `targetId` int(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `statuses` smallint(6) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `note` text DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `targetID` int(11) DEFAULT NULL,
  `message` tinytext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

CREATE TABLE `user_post` (
  `id` int(11) NOT NULL,
  `userID` int(20) DEFAULT NULL,
  `senderId` int(20) DEFAULT NULL,
  `message` tinytext DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
)

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdBY` (`createdBY`),
  ADD KEY `updatedBY` (`updatedBY`);

--
-- Indexes for table `group_follower`
--
ALTER TABLE `group_follower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId` (`groupId`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `groupId` (`groupId`);

--
-- Indexes for table `group_message`
--
ALTER TABLE `group_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId` (`groupId`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `group_meta`
--
ALTER TABLE `group_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `group_post`
--
ALTER TABLE `group_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupID` (`groupID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `username` (`username`,`mobile`,`email`);

--
-- Indexes for table `user_follower`
--
ALTER TABLE `user_follower`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sourceID` (`sourceID`),
  ADD UNIQUE KEY `targetId` (`targetId`),
  ADD UNIQUE KEY `sourceID_3` (`sourceID`,`targetId`),
  ADD KEY `sourceID_2` (`sourceID`);

--
-- Indexes for table `user_friend`
--
ALTER TABLE `user_friend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sourceID` (`sourceID`),
  ADD KEY `targetId` (`targetId`);

--
-- Indexes for table `user_message`
--
ALTER TABLE `user_message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sourceId` (`sourceId`),
  ADD KEY `targetID` (`targetID`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `senderId` (`senderId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_follower`
--
ALTER TABLE `group_follower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_message`
--
ALTER TABLE `group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_meta`
--
ALTER TABLE `group_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_post`
--
ALTER TABLE `group_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_follower`
--
ALTER TABLE `user_follower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_friend`
--
ALTER TABLE `user_friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_message`
--
ALTER TABLE `user_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_post`
--
ALTER TABLE `user_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`createdBY`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`updatedBY`) REFERENCES `users` (`id`);

--
-- Constraints for table `group_follower`
--
ALTER TABLE `group_follower`
  ADD CONSTRAINT `group_follower_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_follower_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `group_member`
--
ALTER TABLE `group_member`
  ADD CONSTRAINT `group_member_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `group_member_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_message`
--
ALTER TABLE `group_message`
  ADD CONSTRAINT `group_message_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_message_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `group_meta`
--
ALTER TABLE `group_meta`
  ADD CONSTRAINT `group_meta_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_post`
--
ALTER TABLE `group_post`
  ADD CONSTRAINT `group_post_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_post_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_follower`
--
ALTER TABLE `user_follower`
  ADD CONSTRAINT `user_follower_ibfk_1` FOREIGN KEY (`sourceID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_follower_ibfk_2` FOREIGN KEY (`targetId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_friend`
--
ALTER TABLE `user_friend`
  ADD CONSTRAINT `user_friend_ibfk_1` FOREIGN KEY (`sourceID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_friend_ibfk_2` FOREIGN KEY (`targetId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_message`
--
ALTER TABLE `user_message`
  ADD CONSTRAINT `user_message_ibfk_1` FOREIGN KEY (`sourceId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_message_ibfk_2` FOREIGN KEY (`targetID`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `user_post_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_post_ibfk_2` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`);





