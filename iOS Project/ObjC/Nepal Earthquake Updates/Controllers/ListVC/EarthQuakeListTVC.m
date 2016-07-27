//
//  EarthQuakeListTVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "EarthQuakeListTVC.h"
// Navigate 2 VC
#import "MapVC.h"
// Model
#import "Quake.h"
// API
#import "APIRequest.h"

@interface EarthQuakeListTVC ()

@end

@implementation EarthQuakeListTVC

#pragma mark - View LifeCycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self designNavBar];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = YES;
    
   // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Bar

- (void)designNavBar {
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(refreshButtonAction:)];
    UIBarButtonItem *graphButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                                 target:self
                                                                                 action:@selector(graphButtonAction:)];
    self.navigationItem.rightBarButtonItems = @[refreshButton, graphButton];
}

- (void)refreshButtonAction:(id)sender {
    NSAssert(NO, @"refreshButtonAction is an abstract method and should be overridden");
}

- (void)graphButtonAction:(id)sender {
    NSAssert(NO, @"graphButtonAction is an abstract method and should be overridden");
}

#pragma mark - Table view data source

// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.quakes.count;
}

// Configure the cell...
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Quake *quake = self.quakes[indexPath.row];
    cell.textLabel.text = quake.epicenter;
    cell.detailTextLabel.text = quake.eqdt;
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"maps"]) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        MapVC *mapVC = (MapVC *)segue.destinationViewController;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Quake *quake = self.quakes[path.row];
        self.selectedQuake = quake;
        mapVC.quake = self.selectedQuake;
    }
}

#pragma mark - Network

- (void)networkRequestWithURL:(NSString *)endString andKey:(NSString *)key {
    __weak EarthQuakeListTVC *weakSelf = self;
    APIRequest *api = [[APIRequest alloc] initWithURL:endString andKey:key];
    [api startWithCompletion:^(NSArray *quakes, NSError *error) {
        if (!error) {
            weakSelf.quakes = quakes;
            [self.tableView reloadData];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error !" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

@end
