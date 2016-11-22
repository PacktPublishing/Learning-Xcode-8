//
//  ViewController.m
//  Address Sanitizer
//
//  Created by Jak Tiano on 10/24/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int* myArray = malloc( sizeof(int) * 2 );
    myArray[0] = 0;
    myArray[1] = 1;
    
    NSLog(@"%i", myArray[3]);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
