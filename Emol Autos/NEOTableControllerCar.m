//
//  NEOTableViewControllerCar.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 18-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEOTableControllerCar.h"
#import "NEODetailControllerCar.h"
#import "NEOCellControllerCar.h"

@interface NEOTableControllerCar()
{
    UIRefreshControl *refreshControl;
}
@end


@implementation NEOTableControllerCar
@synthesize datasource, tableView;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{

    arrayBrand      = [[NSMutableArray alloc] init];
    arrayModel      = [[NSMutableArray alloc] init];
    arrayImageCar   = [[NSMutableArray alloc] init];
    arrayPrice      = [[NSMutableArray alloc] init];
    arrayYear       = [[NSMutableArray alloc] init];
    arrayKms       = [[NSMutableArray alloc] init];
    arrayAviso       = [[NSMutableArray alloc] init];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    
    [refreshControl addTarget:self action:@selector(refreshTableview) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    
    UIImage *image = [UIImage imageNamed:@"galeria.png"];
     buttonStyle = [[UIBarButtonItem alloc]initWithImage:image  style:UIBarButtonItemStyleBordered target:self action:@selector(btnListPressed:)];
    self.navigationItem.leftBarButtonItem = buttonStyle;
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://es-bea.mersap.com/autos/aviso/_search?q=Marca:Mazda%203&size=20"]
                            ];
        //3
        NSDictionary* json = nil;
        if (kivaData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:kivaData
                    options:kNilOptions
                    error:nil];
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self updateUIWithDictionary: json];
        });
        
    });
    
    [super viewDidLoad];
    
    [self.tableView reloadData];
    [refreshControl endRefreshing];

}


-(void)updateUIWithDictionary:(NSDictionary*)json {
    
    @try {
    
        for(int i=0; i<20;i++){
            
            [arrayBrand addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"Marca"]];
            [arrayModel addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"Modelo"]];
            [arrayImageCar addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"imagen"]];
            [arrayPrice addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"precio"]];
            [arrayYear addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"Anno"]];
            [arrayKms addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"Kilometraje"]];
            [arrayAviso addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"texto"]];
        }
        
    }
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Could not parse the JSON feed."
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        NSLog(@"Exception: %@", exception);
    }
    
    
    [self.tableView reloadData];
    
}



-(void)refreshTableview
{
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"Contador:: %i",arrayBrand.count);
    return arrayBrand.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"cellCar";
    
    NEOCellControllerCar *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (!cell){
        cell = [[NEOCellControllerCar alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    
    cell.model.text = [arrayModel objectAtIndex:indexPath.row];
    cell.brand.text = [NSString stringWithFormat:@"%@ %@", [arrayBrand objectAtIndex:indexPath.row], [arrayModel objectAtIndex:indexPath.row]];
    
    int value = [[arrayPrice objectAtIndex:indexPath.row] intValue];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    cell.price.text = [NSString stringWithFormat:@"$%@" ,[[formatter stringFromNumber:[arrayPrice objectAtIndex:indexPath.row]] stringByReplacingOccurrencesOfString:@"," withString:@"."]];
    
    
    cell.year.text = [NSString stringWithFormat:@"%@ %@" ,@"Año ",[arrayYear objectAtIndex:indexPath.row]];
   
    if([[arrayKms objectAtIndex:indexPath.row] doubleValue] > 1 ){
        cell.kms.text = [NSString stringWithFormat:@"%@ %@", [arrayKms objectAtIndex:indexPath.row], @" Kms."];
    }
    if([arrayImageCar objectAtIndex:indexPath.row]){
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"%@" ,[arrayImageCar objectAtIndex:indexPath.row]]]];
        cell.imageCar.image = [UIImage imageWithData: imageData];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NEODetailControllerCar *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detailCar"];
    detail.brand= [NSString stringWithFormat:@"%@ %@", [arrayBrand objectAtIndex:indexPath.row], [arrayModel objectAtIndex:indexPath.row]];
    detail.price= [NSString stringWithFormat:@"$%@" ,[arrayPrice objectAtIndex:indexPath.row]];
    detail.imageCar= [arrayImageCar objectAtIndex:indexPath.row];
    detail.aviso = [arrayAviso objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}

-(IBAction)btnListPressed:(id)sender{
    CGRect destination = mainView.frame;
    
    if (destination.origin.x > 0) {
        destination.origin.x = 0;
    } else {
        destination.origin.x += 255;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        mainView.frame = destination;
        
    } completion:^(BOOL finished) {
        CGRect destination = mainView.frame;
        destination.origin.x -= 7;
        [UIView animateWithDuration:0.10 animations:^{
            mainView.frame = destination;
        }
                         completion:^(BOOL finished){
                             CGRect destination = mainView.frame;
                             destination.origin.x += 7;
                             [UIView animateWithDuration:0.10 animations:^{
                                 mainView.frame = destination;
                             }
                                              completion:^(BOOL finished){
                                                  // do something
                                              }];
                         }];
        //mainView.userInteractionEnabled = !(destination.origin.x > 0);
        
    }];
}

@end
