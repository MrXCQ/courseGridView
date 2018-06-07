//
//  mainViewController.m
//  collectGridView
//
//  Created by zc on 2018/6/6.
//  Copyright © 2018年 Chomp.IMpBear. All rights reserved.
//

#import "mainViewController.h"
#import "courseCollectionCell.h"
#import "UIColor+Chomp.h"
#define screenW   [UIScreen mainScreen].bounds.size.width
#define screenH   [UIScreen mainScreen].bounds.size.height
#define layoutS   screenW / 375.0
#define itemW     (screenW - 50 *layoutS) /5
#define itemH     (itemW/13*16)

@interface mainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView ;
@property(nonatomic,strong) NSMutableArray *corlorArr ;
@property(nonatomic,assign) NSInteger sectionCount ;
@property(nonatomic,strong) UIScrollView *titleScrollView;
@property(nonatomic,strong) UIView *currentDateView ;
@property(nonatomic,strong) UIButton *addButton  ;
@property(nonatomic,strong) UIView *timeEditView ;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionCount = 4 ;
    
    [self configUI];
}

#pragma mark UI
-(void)configUI{
    
    self.navigationController.navigationBar.translucent = NO ;
    self.view.backgroundColor= [UIColor whiteColor ] ;
    
    UIImageView *bgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, screenW, screenH)];
    bgview.image = [UIImage imageNamed:@"背景"] ;
    bgview.contentMode = UIViewContentModeScaleAspectFit ;
    [self.view insertSubview:bgview atIndex:0];
    
    //显示当天日期
    [self.view addSubview:self.currentDateView];
    
    // collectView
    [self.view addSubview:self.collectionView];
    
    // 一周周期
    [self.view addSubview:self.titleScrollView];
    
    //时间编辑按钮
    self.timeEditView.userInteractionEnabled = YES ;
    
    //添加按钮
    [self.addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(configTimeButton)];
}

-(void)configTimeButton{
    if (self.sectionCount == 4) {
        self.sectionCount = 5 ;
    }else self.sectionCount = 4 ;
    [self.collectionView reloadData];
}

-(void)add{
    if (self.sectionCount == 4) {
        self.sectionCount = 5 ;
    }else self.sectionCount = 4 ;
    [self.collectionView reloadData];
}

#pragma mark collectionViewDelegate && collectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sectionCount;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(itemW,itemH);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    courseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"courseCollectionCell" forIndexPath:indexPath];
    
    int arc = arc4random() % 10 ;
    
    cell.containerView.backgroundColor = self.corlorArr[arc];
    
    return  cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"section --- 星期%tu,row --- 第%tu个闹铃",indexPath.section +1,indexPath.row);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(0,0,0,0);
}


#pragma mark -- scrollViewDeleGate 联动效果
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.collectionView) {
        self.titleScrollView.contentOffset = scrollView.contentOffset ;
    }else{
        self.collectionView.contentOffset = scrollView.contentOffset ;
    }
}


-(NSMutableArray *)corlorArr{
    if (!_corlorArr) {
        UIColor *color1 = [UIColor colorWithHex:@"5ad1ff"] ;
        UIColor *color2 = [UIColor colorWithHex:@"d0bcff"] ;
        UIColor *color3 = [UIColor colorWithHex:@"7bd6b7"] ;
        UIColor *color4 = [UIColor colorWithHex:@"92abee"] ;
        UIColor *color8 = [UIColor colorWithHex:@"f49e9d"] ;
        UIColor *color5 = [UIColor colorWithHex:@"d0bcff"] ;
        UIColor *color6 = [UIColor colorWithHex:@"a0d060"] ;
        UIColor *color7 = [UIColor colorWithHex:@"c0a7d8"] ;
        UIColor *color9 = [UIColor colorWithHex:@"ff7800"] ;
        UIColor *color0 = [UIColor colorWithHex:@"e895b1"] ;
        
        _corlorArr = [NSMutableArray arrayWithObjects:color0,color1,color2,color3,color4,color5,color6,color7,color8,color9, nil] ;
    }
    return _corlorArr ;
}

-(UIView *)currentDateView{
    if (!_currentDateView) {
        _currentDateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
        
        _currentDateView.backgroundColor = [UIColor colorWithHex:@"A6E3FF"] ;
        _currentDateView.center = CGPointMake(screenW/2, 30) ;
        _currentDateView.layer.cornerRadius = 15 ;
        _currentDateView.layer.masksToBounds = YES ;
        
        UIImageView *leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 20, 20)];
        leftImgView.image = [UIImage imageNamed:@"时间日期图标"] ;
        [_currentDateView addSubview:leftImgView];
        
        UILabel *dateLable  = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 100, 20)];
        dateLable.font = [UIFont systemFontOfSize:14] ;
        dateLable.text = @"2018/06/01 ";
        dateLable.textAlignment = NSTextAlignmentCenter ;
        [_currentDateView addSubview:dateLable];
    }
    return _currentDateView ;
}

-(UIScrollView *)titleScrollView{
    if (!_titleScrollView) {
        
        _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(50*layoutS, 55, itemW*5, 25)];
        _titleScrollView.contentSize = CGSizeMake(itemW *7, 25) ;
        _titleScrollView.delegate = self ;
        _titleScrollView.bounces = NO ;
        _titleScrollView.showsHorizontalScrollIndicator = NO ;
        
        NSArray *dayArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
        
        for (int i =0; i<7; i++) {
            UILabel *dayLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, itemW -10, 25)];
            dayLable.backgroundColor = [UIColor whiteColor] ;
            dayLable.text = dayArr[i] ;
            dayLable.font = [UIFont systemFontOfSize:16] ;
            dayLable.textAlignment = NSTextAlignmentCenter ;
            dayLable.center = CGPointMake(itemW*i+(itemW/2), 12.5) ;
            [_titleScrollView addSubview:dayLable];
        }
    }
    return _titleScrollView ;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0 ;
        layout.minimumLineSpacing = 0 ;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(50*layoutS, 80, itemW * 5,itemH * 5)
                                            collectionViewLayout:layout];
        
        _collectionView.contentSize = CGSizeMake(itemW * 7,itemH * 5) ;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[courseCollectionCell class] forCellWithReuseIdentifier:@"courseCollectionCell"];
        
        _collectionView.showsVerticalScrollIndicator = NO ;
        _collectionView.showsHorizontalScrollIndicator = NO ;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO ;
    }
    return _collectionView ;
}


-(UIButton *)addButton{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _addButton.frame = CGRectMake(screenW/2 - 80, itemH * 5 + 120*layoutS, 160, 50 ) ;
        _addButton.backgroundColor = [UIColor colorWithHex:@"3FC1FD"] ;
        _addButton.layer.masksToBounds = YES ;
        _addButton.layer.cornerRadius = 25 ;
        [_addButton setTitle:@"添 加" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.view addSubview:_addButton];
    }
    return _addButton ;
}

-(UIView *)timeEditView{
    if (!_timeEditView ) {
        _timeEditView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, 50*layoutS, itemH *5)];
        
        for (int i =0; i<self.sectionCount; i++) {
            UIButton *timeBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
            timeBtn.frame = CGRectMake(0, 0, 50*layoutS, itemH) ;
            timeBtn.center  = CGPointMake(25*layoutS, itemH*i +itemH/2) ;
            [timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            timeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [timeBtn setTitle:@"08:00" forState:UIControlStateNormal];
            [_timeEditView addSubview:timeBtn];
        }
        
        [self.view addSubview:_timeEditView];
    }
    return _timeEditView ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
