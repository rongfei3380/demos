//
//  ViewController.m
//  Block
//
//  Created by chengfei on 2019/3/4.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "ViewController.h"
#import "MCBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MCBlock *obj = [[MCBlock alloc] init];
    [obj testAllTypes];
}


@end
