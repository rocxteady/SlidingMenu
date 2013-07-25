SlidingMenu 0.1 For iOS
==============

Requirements
--------------
- Xcode 4.5 or higher
- iOS 5.0 or higher
- ARC

Contact
--------------
- [Twitter](https://twitter.com/rocxteady2)
- [Facebook](https://www.facebook.com/rocxteady)
- [E-Mail](mailto:ulas.sancak@hotmail.com.tr)

Demo
--------------
Build and run the project in Xcode.

Screens
--------------
![1](http://s5.postimg.org/er8fguflj/i_OS_Simulator_Screen_shot_Jul_26_2013_2_08_34_A.png)
![2](http://s5.postimg.org/wwlduwf3r/i_OS_Simulator_Screen_shot_Jul_26_2013_2_07_46_A.png)
![3](http://s5.postimg.org/57yqnds3b/i_OS_Simulator_Screen_shot_Jul_26_2013_2_07_50_A.png)

in ViewController.h
--------------

    #import <UIKit/UIKit.h>
    #import "SlidingMenu.h"


    @interface ViewController : UIViewController
    {
        SlidingMenu *menu;
    }
    - (IBAction)openOrCloseMenu:(UIButton *)sender;
    @property (strong, nonatomic) NSMutableArray *buttons;

    @end
    
in ViewController.m
--------------
    
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

License
--------------
You can do with this project whatever you want. :)
