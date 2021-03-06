//
//  HXTBrowseHouseEstateViewController.m
//  ButlerCard
//
//  Created by johnny tang on 2/21/14.
//  Copyright (c) 2014 johnny tang. All rights reserved.
//

#import "HXTBrowseHouseEstateViewController.h"
#import "HXTAccountManager.h"
#import "HXTMyProperties.h"

@interface HXTBrowseHouseEstateViewController ()
@property (weak, nonatomic) IBOutlet UIButton *chooseCityButton;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIControl *coverView;
@property (weak, nonatomic) IBOutlet UISearchBar *propertySearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *housingEstatesCollectionView;
@property (copy, nonatomic) NSMutableArray *housingEstateNamesToShow;
@end

@implementation HXTBrowseHouseEstateViewController

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
    
    self.navigationController.navigationBarHidden = NO;
    
    _housingEstateNamesToShow = [[NSMutableArray alloc] initWithArray:[HXTMyProperties sharedInstance].allHousingEstateNames];
    
    [[HXTAccountManager sharedInstance] addObserver:self
                                         forKeyPath:@"currentCity"
                                            options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                                            context:NULL];
    _cityLabel.text = [HXTAccountManager sharedInstance].currentCity;
}

#pragma -- key value abserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentCity"] && object == [HXTAccountManager sharedInstance]) {
        _cityLabel.text = [HXTAccountManager sharedInstance].currentCity;
    } 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _chooseCityButton.selected = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [_propertySearchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -- UISearchBar Delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.view bringSubviewToFront:_coverView];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"1searchBar.text = %@ searchText = %@", searchBar.text, searchText);
    [self startSearch:searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.view sendSubviewToBack:_coverView];
    NSLog(@"3searchBar.text = %@", searchBar.text);
}

- (void)startSearch:(NSString *)searchString {
    if (searchString == nil || (id)searchString==[NSNull null] ||
        searchString.length <= 0 || [searchString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length<=0) {
        [_housingEstateNamesToShow addObjectsFromArray:[HXTMyProperties sharedInstance].allHousingEstateNames];
    } else {
        [_housingEstateNamesToShow removeAllObjects];
        for (NSUInteger i = 0; i < [HXTMyProperties sharedInstance].allHousingEstateNames.count; i++) {
            NSRange range = [[HXTMyProperties sharedInstance].allHousingEstateNames[i] rangeOfString:searchString];
            if (range.location != NSNotFound) {
                [_housingEstateNamesToShow addObject:[HXTMyProperties sharedInstance].allHousingEstateNames[i]];
            }
        }
    }
    
    [_housingEstatesCollectionView reloadData];
}

#pragma -- UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _housingEstateNamesToShow.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *collectionViewCellIdentifier= @"CollectionViewCellIdentifier";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    ((UIImageView *)[cell viewWithTag:100]).image = [UIImage imageNamed:[NSString stringWithFormat:@"property_house%lu", (long)(indexPath.row % 7 + 1)]];
    ((UILabel *)[cell viewWithTag:101]).text = _housingEstateNamesToShow[indexPath.row];
    
    return cell;
}


#pragma -- UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath indexPath.section = %li, indexPath.row = %li", (long)indexPath.section, (long)indexPath.row);

    UIViewController *loginViewcontroller = [[UIStoryboard storyboardWithName:@"AccountManager" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginStoryboardID"];
    
    [loginViewcontroller setValue:self forKey:@"delegate"];
    [self.navigationController pushViewController:loginViewcontroller animated:YES];

}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -- LoginViewController delegate

-(void)loginViewController:(UIViewController *)loginViewController loginDidSucessed:(BOOL)sucessed {
    NSLog(@"%s %s %d Login sucessed = %@", __FILE__, __FUNCTION__, __LINE__, sucessed? @"YES": @"NO");
}


#pragma mark -- UI Actions

- (IBAction)backButtonPressed:(UIButton *)sender {
    
    if (self.navigationController.viewControllers.count == 1) { //使用的模态方式进入改页面
        [self dismissViewControllerAnimated:YES completion:^{}];
    } else { //其他Controller通过导航控制器进入该页面
         [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)chooseCityButtonPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)backgroudTouchUpInside:(id)sender {
    [_propertySearchBar resignFirstResponder];
    [self.view sendSubviewToBack:_coverView];
}

- (IBAction)appleyOpenPropertyButtonPressed:(id)sender {
    NSLog(@"appleyOpenPropertyButtonPressed");
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ChooseCityStoryboardID"]) {
        //模态显示动画
//        ((UIViewController *)segue.destinationViewController).modalPresentationStyle = UIModalPresentationPageSheet;
//        ((UIViewController *)segue.destinationViewController).modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
}

@end
