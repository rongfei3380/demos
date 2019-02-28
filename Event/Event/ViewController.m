//
//  ViewController.m
//  Event
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "ExpandButton.h"

@interface ViewController (){
    CustomButton *_cornerButton;
    ExpandButton *_expandButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cornerButton = [CustomButton buttonWithType:UIButtonTypeCustom];
    _cornerButton.frame = CGRectMake(100, 100, 120, 120);
    [_cornerButton setBackgroundColor:[UIColor blueColor]];
    [_cornerButton addTarget:self action:@selector(clickCornerButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cornerButton];
    
    _expandButton = [ExpandButton buttonWithType:UIButtonTypeCustom];
    _expandButton.frame = CGRectMake(100, 300, 120, 120);
    [_expandButton setBackgroundColor:[UIColor redColor]];
    [_expandButton addTarget:self action:@selector(clickCornerButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_expandButton];

}

- (void)clickCornerButton:(id)sender {
    NSLog(@"click");
}

@end
