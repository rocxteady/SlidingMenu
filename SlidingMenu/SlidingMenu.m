//
//  SlidingMenu.m
//  SlidingMenu
//
//  Created by Ulaş Sancak on 7/25/13.
//  Copyright (c) 2013 Sancak. All rights reserved.
//

#import "SlidingMenu.h"

@implementation SlidingMenu

-(id)init{
    self = [super init];
    if (self) {
        isMenuOpen = NO;
        _buttonMenuOriginYOffset = 120;
        _spaceBetweenButtons = 20;
        _buttonMenuOriginXOffset = 10;
        _buttonSize = CGSizeMake(73, 36);
    }
    return self;
}

- (NSArray*) sortByObjectTag:(NSArray *)array
{
    return [array sortedArrayUsingComparator:^NSComparisonResult(id objA, id objB){
        return(
               ([objA tag] < [objB tag]) ? NSOrderedAscending  :
               ([objA tag] > [objB tag]) ? NSOrderedDescending :
               NSOrderedSame);
    }];
}

-(void)setButtonsArray:(NSArray *)buttonsArray{
    
    buttonsArrayObject = [NSArray arrayWithArray:[self sortByObjectTag:buttonsArray]];
    for (int i = 0; i<buttonsArrayObject.count; i++) {
        UIButton *button = [buttonsArrayObject objectAtIndex:i];

        CGRect frame = button.frame;
        
        frame.size.width = _buttonSize.width;
        frame.size.height = _buttonSize.height;
        float buttonHeight = frame.size.height;
        
        if (i%2 == 0) {
            frame.origin.x = -frame.size.width;
            frame.origin.y = _buttonMenuOriginYOffset+((_spaceBetweenButtons+buttonHeight)*i/2);
        }
        else {
            frame.origin.x = [[UIScreen mainScreen] bounds].size.width;
            frame.origin.y = _buttonMenuOriginYOffset+((_spaceBetweenButtons+buttonHeight)*((i-1)/2));
        }
        

        button.frame = frame;
    }
}

-(void)openMenuWithAnimation:(UIButton *)button withIndex:(int)index{
    float delay = 0;
    if (index%2==0) {
        delay = 0.1*index;
    }
    else {
        delay = 0.1*(index-1);
    }
    [UIView animateWithDuration:0.25
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         CGRect frame = button.frame;
                         if (index%2==0) {
                             frame.origin.x = _buttonMenuOriginXOffset;
                         }
                         else {
                             frame.origin.x = [[UIScreen mainScreen] bounds].size.width-frame.size.width-_buttonMenuOriginXOffset;
                         }
                         button.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void)closeMenuWithAnimation:(UIButton *)button withIndex:(int)index{
    float delay = 0;
    if (index%2==0) {
        delay = 0.1*index;
    }
    else {
        delay = 0.1*(index-1);
    }
    [UIView animateWithDuration:0.25
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         CGRect frame = button.frame;
                         if (index%2==0) {
                             frame.origin.x = -button.frame.size.width;
                         }
                         else {
                             frame.origin.x = [[UIScreen mainScreen] bounds].size.width;
                         }
                         button.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(void)openOrCloseButtonsMenu{
    
    if (isMenuOpen) {
        for (int i = 0; i<buttonsArrayObject.count; i++) {
            [self closeMenuWithAnimation:[buttonsArrayObject objectAtIndex:i] withIndex:i];
        }
        isMenuOpen = NO;
    }
    else {
        for (int i = 0; i<buttonsArrayObject.count; i++) {
            [self openMenuWithAnimation:[buttonsArrayObject objectAtIndex:i] withIndex:i];
        }
        isMenuOpen = YES;
    }
    
}

-(void)openButtonsMenu{
    for (int i = 0; i<buttonsArrayObject.count; i++) {
        [self openMenuWithAnimation:[buttonsArrayObject objectAtIndex:i] withIndex:i];
    }
    isMenuOpen = YES;
}

-(void)closeButtonsMenu{
    for (int i = 0; i<buttonsArrayObject.count; i++) {
        [self closeMenuWithAnimation:[buttonsArrayObject objectAtIndex:i] withIndex:i];
    }
    isMenuOpen = NO;
}

@end
