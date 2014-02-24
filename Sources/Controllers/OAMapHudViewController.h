//
//  OAMapHudViewController.h
//  OsmAnd
//
//  Created by Alexey Pelykh on 8/21/13.
//  Copyright (c) 2013 OsmAnd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OAMapHudViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *compassBox;
@property (weak, nonatomic) IBOutlet UIButton *compassButton;
@property (weak, nonatomic) IBOutlet UIImageView *compassImage;
- (IBAction)onCompassButtonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *mapModeButton;
- (IBAction)onMapModeButtonClicked:(id)sender;

- (IBAction)onOptionsMenuButtonClicked:(id)sender;

@end
