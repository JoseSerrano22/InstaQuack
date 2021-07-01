//
//  ComposeViewController.m
//  twitter
//
//  Created by jose1009 on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *contentCharacterCountLabel;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.delegate = self;
    [self.contentCharacterCountLabel setText:[NSString stringWithFormat:@"%d", 280]];
}

- (void)textViewDidChange:(UITextView *)textView {
    // Length of tweet can't exceed 280 characters
    NSInteger restrictedLength = 280;
    NSInteger lengthLeft = 280 - [[self.textView text] length];
    [self.contentCharacterCountLabel setText:[NSString stringWithFormat:@"%ld", (long)lengthLeft]];
    
    if([[self.textView text] length] > restrictedLength){
        self.contentCharacterCountLabel.textColor = UIColor.redColor;
    } else {
        self.contentCharacterCountLabel.textColor = UIColor.blackColor;
    }
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tweetButton:(id)sender {
    [[APIManager shared] postStatusWithText:self.textView.text completion:^(Tweet *tweet, NSError *error) {
        if (tweet) {
            [self.delegate didTweet:tweet];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            NSLog(@"Error posting: %@", error.localizedDescription);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
