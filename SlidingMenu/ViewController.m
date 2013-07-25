//
//  ViewController.m
//  SlidingMenu
//
//  Created by Ulaş Sancak on 7/25/13.
//  Copyright (c) 2013 Sancak. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIButton *button in _buttons) {
        if (button != nil) {
            [self.view addSubview:button];
        }
    }
    [menu openButtonsMenu];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Sliding Menu";
    
    _buttons = [NSMutableArray array];
    [self createButtonsWithQuantity:8];
    menu = [[SlidingMenu alloc]init];
    [menu setButtonsArray:_buttons];

    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)createButtonsWithQuantity:(NSInteger)quantity{
    for (int i = 0; i<quantity; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button addTarget:self action:@selector(menuButonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"button-blue"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"button-blue-pressed"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"Button %i",button.tag] forState:UIControlStateNormal];
        button.layer.cornerRadius = 5.0;
        [self.view addSubview:button];
        [_buttons addObject:button];
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [menu closeButtonsMenu];
    for (UIButton *button in _buttons) {
        [button removeFromSuperview];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openOrCloseMenu:(UIButton *)sender {
    NSLog(@"%@",[self.view subviews]);
    [menu openOrCloseButtonsMenu];
}
- (void)menuButonAction:(UIButton *)sender {
    NSLog(@"%i. button clicked",sender.tag);
    [self performSegueWithIdentifier:@"detail" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"detail"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        NSString *title = [NSString stringWithFormat:@"Button %i Title",[(UIButton *)sender tag]];
        detailViewController.viewControllerTitle = title;
    }
}

@end
