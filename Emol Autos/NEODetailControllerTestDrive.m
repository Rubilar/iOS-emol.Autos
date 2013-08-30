//
//  NEODetailControllerTestDrive.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 30-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEODetailControllerTestDrive.h"

@implementation NEODetailControllerTestDrive
@synthesize title,descentTitle,imageTestDrive,titleLabel,descentTitleLabel,imageTestDriveView;

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
    titleLabel.text = title;
    NSLog(@"variable SecondTitle %@", descentTitle);
    descentTitleLabel.text = descentTitle;
    NSLog(@"variable IMG %@", imageTestDrive);
    imageTestDriveView.image = [UIImage imageNamed:imageTestDrive];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
