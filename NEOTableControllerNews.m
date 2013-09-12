//
//  NEOTableControllerNews.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 25-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEOTableControllerNews.h"
#import "NEODetailControllerNews.h"
#import "NEOCellControllerNews.h"

@interface NEOTableControllerNews()
{
    UIRefreshControl *refreshControl;
}
@end

@implementation NEOTableControllerNews
@synthesize datasource, tableView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    
    arrayTitle      = [[NSMutableArray alloc] init];
    arrayDescentTitle      = [[NSMutableArray alloc] init];
    arrayImageNews   = [[NSMutableArray alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    
    [refreshControl addTarget:self action:@selector(refreshTableview) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://club.mersap.com/emol_automovil_merge/json_noticias.php"]
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
            
            [arrayTitle addObject:json[@"titulo_noticia"][i][@"_source"][@"aviso"][@"Marca"]];
            [arrayDescentTitle addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"Modelo"]];
            [arrayImageNews addObject:json[@"hits"][@"hits"][i][@"_source"][@"aviso"][@"imagen"]];

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
    return arrayTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"cellNews";
    
    NEOCellControllerNews *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (!cell){
        cell = [[NEOCellControllerNews alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    
    cell.title.text = [arrayTitle objectAtIndex:indexPath.row];
    cell.descentTitle.text = [arrayDescentTitle objectAtIndex:indexPath.row];
    
    if([arrayImageNews objectAtIndex:indexPath.row]){
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"%@" ,[arrayImageNews objectAtIndex:indexPath.row]]]];
        cell.imageNews.image = [UIImage imageWithData: imageData];
        
    }

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NEODetailControllerNews *detailNews = [self.storyboard instantiateViewControllerWithIdentifier:@"detailNews"];
    detailNews.title= [arrayTitle objectAtIndex:indexPath.row];
    detailNews.descentTitle= [arrayDescentTitle objectAtIndex:indexPath.row];
    detailNews.imageNews= [arrayImageNews objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailNews animated:YES];
    
}

@end
