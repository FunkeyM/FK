//
//  ViewController.m
//  FKProgress
//
//  Created by sheng hou on 2022/1/18.
//

#import "ViewController.h"
#import "FKCircleProgressView.h"

struct Book {
    char *a;
    int d;
    int b;
    double c;
    char e;
    double g;
};

struct Boola{
    double a ;
    char b;
    int c;
};

@interface ViewController ()

@property (nonatomic, strong) FKCircleProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat progressWidth = screenWidth-20*2;
    self.progressView = [[FKCircleProgressView alloc] initWithFrame:CGRectMake(20, self.view.center.y - progressWidth/2, progressWidth, progressWidth)];
    self.progressView.lineWidth = 4;
    self.progressView.bgLineColor = UIColor.blackColor;
    self.progressView.lineColor = UIColor.blueColor;
    self.progressView.progress = 0.5;
    [self.view addSubview:self.progressView];
   
    testStruct();
}

void testStruct(){
    char a[5] = {'a','b','c','d','f'};
    struct Book bbb = {&a,1,2,3,4,5};
    struct Book *aaa = &bbb;
    NSLog(@"asd:::::%c",*(aaa->a + 1 ));
}

@end
