//
//  ViewController.h
//  SlidingMenu
//
//  Created by Ulaş Sancak on 7/25/13.
//  Copyright (c) 2013 Sancak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidingMenu.h"


@interface ViewController : UIViewController
{
    SlidingMenu *menu;
}
- (IBAction)openOrCloseMenu:(UIButton *)sender;
@property (strong, nonatomic) NSMutableArray *buttons;

@end
