//
//  SmMenuViewController.m
//  TestSlideMenu
//
//  Created by Masamoto Miyata on 2012/10/20.
//  Copyright (c) 2012年 Masamoto Miyata. All rights reserved.
//

#import "SmMenuViewController.h"

@interface SmMenuViewController ()

@end

@implementation SmMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UIViewController *firstViewController = [[UIViewController alloc] init];
        firstViewController.view.backgroundColor = [UIColor orangeColor];
        firstViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(openMenu:)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(10, 10, 100, 30);
        [btn setTitle:@"Open" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(openModal:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
        
        contentController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        [self addChildViewController: contentController];
        [self.view addSubview: contentController.view];
        
        
        
        
    }
    return self;
}

-(void)openModal:(id)sender
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIViewController *vc =[[UIViewController alloc] init];
    vc.view.frame = CGRectMake(0, 0, 320, 200);
    vc.view.backgroundColor = [UIColor grayColor];
    
    [window.rootViewController presentSemiViewController:vc withOptions:@{
     KNSemiModalOptionKeys.pushParentBack : @(NO),
     KNSemiModalOptionKeys.parentAlpha : @(0.8)
	 }];
}

-(void)openMenu:(id) sender
{
    [self toggleMenuController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}

-(void)toggleMenuController
{
    isRevealed = !isRevealed;
    
    UIView *targetView = contentController.view;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat originX = isRevealed ? 260 : 0;
        CGRect frame = targetView.frame;
        frame.origin.x = originX;
        targetView.frame = frame;
    } completion:^(BOOL finished){
        //NSLog(@"%@", finished ? @"YES" : @"NO");
    }];
}
@end
