//
//  GetLastestJobCell.h
//  ZhiLianEmploy
//
//  Created by Ibokan on 13-2-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetLastestJobCell : UITableViewCell
{
   NSDateFormatter *dateFormatter1;

}
@property(nonatomic,retain)UIButton * chooseImg;
@property(nonatomic,retain)UILabel * jobName;
@property(nonatomic,retain)UILabel * companyName;
@property(nonatomic,retain)UILabel * date;
@property(nonatomic,retain)UILabel * address;
@property(nonatomic,retain)UIImageView * accessoryImg;


@end
