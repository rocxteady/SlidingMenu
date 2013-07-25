//
//  SlidingMenu.h
//  SlidingMenu
//
//  Created by Ulaş Sancak on 7/25/13.
//  Copyright (c) 2013 Sancak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlidingMenu : NSObject
{
    NSArray *buttonsArrayObject;
    BOOL isMenuOpen;
}

@property (readwrite, nonatomic) CGSize buttonSize;
@property (readwrite, nonatomic) float buttonMenuOriginYOffset;
@property (readwrite, nonatomic) float spaceBetweenButtons;
@property (readwrite, nonatomic) float buttonMenuOriginXOffset;

-(void)setButtonsArray:(NSArray *)buttonsArray;

-(void)openOrCloseButtonsMenu;

-(void)openButtonsMenu;

-(void)closeButtonsMenu;

@end
