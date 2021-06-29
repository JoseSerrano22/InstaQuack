//
//  TweetCell.m
//  twitter
//
//  Created by jose1009 on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    
    self.nameLabel.text = tweet.user.name;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@",tweet.user.screenName];
    self.contentLabel.text = tweet.text;
  
//    self.timeSinceCreation.text = tweet.timeSinceCreation;
    self.retweetNumLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.favoriteNumLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    
    // getting profile picture from api and setting it in the table cell
    NSURL *profileURL = [NSURL URLWithString:tweet.user.profilePictureURL];
    self.profilePictureView.image = nil;
    [self.profilePictureView setImageWithURL:profileURL];
}

@end
