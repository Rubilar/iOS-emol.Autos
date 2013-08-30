//
//  NEODetailControllerNews.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 25-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEODetailControllerNews.h"
@implementation  NEODetailControllerNews
@synthesize title,descentTitle,imageNews,titleLabel,descentTitleLabel,imageNewsView;

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
    NSLog(@"variable IMG %@", imageNews);
    imageNewsView.image = [UIImage imageNamed:imageNews];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
