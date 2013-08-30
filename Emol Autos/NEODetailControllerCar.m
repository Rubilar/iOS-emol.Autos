//
//  NEODetailControllerCar.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 18-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEODetailControllerCar.h"
@implementation NEODetailControllerCar
@synthesize brand,model,price,imageCar,aviso,brandLabel,modelLabel,priceLabel,imageCarView,avisoLabel;
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
    brandLabel.text = brand;
    modelLabel.text = model;
    priceLabel.text = price;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"%@" ,imageCar]]];
    imageCarView.image = [UIImage imageWithData: imageData];
    avisoLabel.text = aviso;

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
