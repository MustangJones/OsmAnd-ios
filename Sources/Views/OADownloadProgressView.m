//
//  OADownloadProgressView.m
//  OsmAnd
//
//  Created by Anton Rogachevskiy on 01.10.14.
//  Copyright (c) 2014 OsmAnd. All rights reserved.
//

#import "OADownloadProgressView.h"

@interface OADownloadProgressView()

typedef enum {
    kDownloadProgressButtonStatePause = 0,
    kDownloadProgressButtonStateResume
} kDownloadProgressButtonState;

@property kDownloadProgressButtonState buttonState;

@end

@implementation OADownloadProgressView

- (instancetype)init
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    if ([bundle count])
    {
        self = [bundle firstObject];
        if (self) {
            [self.progressBarView setProgress:0];
            self.buttonState = kDownloadProgressButtonStatePause;
            [self setButtonStatePause];
            
            self.layer.borderWidth=1.0f;
            self.layer.borderColor=[[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.3] CGColor];
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    if ([bundle count])
    {
        self = [bundle firstObject];
        if (self) {
            [self.progressBarView setProgress:0];
            self.frame = frame;
            self.buttonState = kDownloadProgressButtonStatePause;
            [self setButtonStatePause];

            self.layer.borderWidth=1.0f;
            self.layer.borderColor=[[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.3] CGColor];
        }
    }
    return self;
}

-(void)setProgress:(float)progress {
    [self.progressBarView setProgress:progress];
}

-(void)setTitle:(NSString*)title {
    [self.titleView setText:title];
}

- (IBAction)startStopButtonClicked:(id)sender {
    
    if(self.buttonState == kDownloadProgressButtonStatePause) { // pause
        [self.delegate pauseDownloadButtonClicked:self];
        [self setButtonStateResume];
    }
    else {
        [self.delegate resumeDownloadButtonClicked:self];
        [self setButtonStatePause];
    }
}

-(void)setButtonStatePause {
    self.buttonState = kDownloadProgressButtonStatePause;
    [self.startStopButtonView setImage:[UIImage imageNamed:@"Btn-Pause.png"] forState:UIControlStateNormal];
}

-(void)setButtonStateResume {
    self.buttonState = kDownloadProgressButtonStateResume;
    [self.startStopButtonView setImage:[UIImage imageNamed:@"Btn-Play.png"] forState:UIControlStateNormal];
}


@end
