//
//  ViewController.m
//  PrysmicPhoneIOS_C
//
//  Created by Daniel Chudy on 12/17/15.
//  Copyright © 2015 Daniel Chudy. All rights reserved.
//

#import "ViewController.h"
#import "BLEUser.h"
#import "Discovery.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *users;
@property (strong, nonatomic) Discovery *discovery;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.users = [NSArray array];
    
    NSString *uuidStr = @"B9407F30-F5F8-466E-AFF9-25556B57FE99";
    CBUUID *uuid = [CBUUID UUIDWithString:uuidStr];
    
    // start Discovery //Dillion 5658
    // 21812 annie
    self.discovery = [[Discovery alloc] initWithUUID:uuid username:@"21812" startOption:2 usersBlock:^(NSArray *users, BOOL usersChanged) {
        self.discovery.shouldDiscover = true;
        self.discovery.shouldAdvertise = false;
        NSLog(@"Updating table view with users count : %lu", (unsigned long)users.count);
        
        if(users.count > 0) {
           NSLog(@"we found 1 and we boradcasting");
            self.discovery.shouldAdvertise = true;
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
