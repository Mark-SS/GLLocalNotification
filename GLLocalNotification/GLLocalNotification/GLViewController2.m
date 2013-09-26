//
//  GLViewController2.m
//  GLLocalNotification
//
//  Created by gongliang on 13-9-25.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import "GLViewController2.h"
@interface GLViewController2 ()

@property (nonatomic, copy) NSString *str;

@end

@implementation GLViewController2

- (void)dealloc
{
    NSLog(@"2 dealloc");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    GLObject *object = [GLObject new];
//    object.str = @"aa";
//    
//    __weak GLObject *aa = object;
//    object.block = ^{
//        
//        
//        NSLog(@"%@",aa.str);
//    };
//    
//    object.block();
//    self.str = @"abc";
//    __weak GLViewController2 *a = self;
//    __block NSString *str = self.str;
//    self.block = ^{
//        
//        str = @"aa";
//    };
//    NSLog(@"a = %@",str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)disMiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
