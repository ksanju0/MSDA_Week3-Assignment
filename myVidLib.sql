--1.Videos table.  Create one table to keep track of the videos.  This table should include a unique ID, the title of the video, the length in minutes, and the URL.  
--Populate the table with at least three related videos from YouTube or other publicly available resources..
DROP TABLE if exists How2Vid,vidReview,How2VidReview  cascade;

CREATE TABLE How2Vid(
	video_id serial PRIMARY KEY,
	video_titl VARCHAR (250) UNIQUE NOT NULL,
	video_len integer  NOT NULL,
	video_url VARCHAR (355) UNIQUE NOT NULL
	
);
-- 2.Reviewers table.  Create a second table that provides at least two user reviews for each of at least two of the videos.  These should be imaginary reviews that include columns for the 
--user’s name (“Mohan”, “Joy”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”).  
--There should be a column that links back to the ID column in the table of videos..

CREATE TABLE vidReview(
	review_video_id serial PRIMARY KEY,
	user_id INTEGER NOT NULL,
	user_name VARCHAR (50) UNIQUE NOT NULL,
	user_rating integer  ,
	usertext_review VARCHAR (250)
	
);






CREATE TABLE How2VidReview
(
  video_id integer NOT NULL,
  review_video_id integer NOT NULL,
  
  PRIMARY KEY (video_id, review_video_id),
  CONSTRAINT How2VidReview_id_fkey FOREIGN KEY (review_video_id)
      REFERENCES vidReview (review_video_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT How2Vid_videoID_fkey FOREIGN KEY (video_id)
      REFERENCES How2Vid (video_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- Adding data to the tables


Insert into How2Vid (video_id,video_titl,video_len,video_url) values 
(1,'9 Games Xbox One is Finally Getting in 2015', 7,'https://www.youtube.com/watch?v=ZvwWmYUro38'),
(2,'Screamride Xbox One Gameplay',5,'https://www.youtube.com/watch?v=kk9f0elY_oI'),
(3,'State Of Decay Xbox One Gameplay',7,'https://www.youtube.com/watch?v=-ljS381c3r8'),
(4,'5 Things About Halo 5 We Learned Playing the Beta',4,'https://www.youtube.com/watch?v=qFtY-RciWHE'),
(5,'Star Wars Battlefront: 7 Things We Dont Want',7,'https://www.youtube.com/watch?v=GSNmz58T25o'),
(6,'Minecraft XBOX Survival Madness',26,'https://www.youtube.com/watch?v=i6o8tRP84Yk'),
(7,'Minecraft XBOX Hide and Seek',23,'https://www.youtube.com/watch?v=RinABwJqYzg'),
(8,'Minecraft: THE RAKE CHALLENGE GAMES',27,'https://www.youtube.com/watch?v=AmGOE65UwgE');

Insert into vidReview(review_video_id,user_id,user_name,user_rating,usertext_review) values
(1,123,'MrBrodernafluff',4,'thought it looked amazing on some trading site. but this is great'),
(2,546,'Centerfold Skye',3,'its ok not that great'),
(3,786,'Barone',3,'I like it'),
(4,245,'Sshinyit',2,'I love it, will buy it now'),
(5,289,'samd',4,'umm I will wait'),
(6,890,'Greatgamer',5,'good one'),
(7,8090,'reatjamer',3,'very good'),
(8,1890,'Gatecrasher',2,'do not buy');

-- Report for highest rated video with key attributes
Select video_titl,user_rating,usertext_review,video_len,video_url from How2Vid h join vidReview v on h.video_id=v.review_video_id order by user_rating desc