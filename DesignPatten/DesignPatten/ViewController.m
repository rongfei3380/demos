//
//  ViewController.m
//  DesignPatten
//
//  Created by chengfei on 2019/3/10.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "ViewController.h"
#import "Single.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Single *single = [Single sharedInstance];
    NSLog(@"single is %@", single);
    Single *copySingle = [single copy];
    NSLog(@"copy single is %@", copySingle);
}


@end
