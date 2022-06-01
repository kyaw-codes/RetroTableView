//
//  TodoCell.m
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import "TodoCell.h"
#import "NSObject+TypecastWithAssertion.h"

@implementation TodoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _badgeContainerView.layer.cornerRadius = _badgeContainerView.frame.size.height / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)configureCellWithVo:(TodoVO *)vo {
    _lblTitle.text = vo.title;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"E d MMM";
    _lblDate.text = [dateFormatter stringFromDate:vo.createdDateTime];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    timeFormatter.dateFormat = @"HH:mm";
    _lblTime.text = [timeFormatter stringFromDate:vo.createdDateTime];
    
    _imgCheck.tintColor = vo.isCompleted ? UIColor.systemGreenColor : UIColor.systemGrayColor;
    
    switch (vo.priority) {
        case Low:
            _badgeContainerView.backgroundColor = [[UIColor systemYellowColor] colorWithAlphaComponent:0.2];
            [self badgeLabel].text = @"NOT IMPORTANT";
            [self badgeLabel].textColor = [UIColor blackColor];
            break;
        case Normal:
            _badgeContainerView.backgroundColor = [[UIColor systemBlueColor] colorWithAlphaComponent:0.2];
            [self badgeLabel].text = @"NORMAL";
            [self badgeLabel].textColor = [UIColor systemBlueColor];
            break;
        case Important:
            _badgeContainerView.backgroundColor = [[UIColor systemRedColor] colorWithAlphaComponent:0.2];
            [self badgeLabel].text = @"IMPORTANT";
            [self badgeLabel].textColor = [UIColor systemRedColor];
            break;
    }
}

- (UILabel *)badgeLabel {
    return [UILabel typecastWithAssertion:_badgeContainerView.subviews.firstObject];
}

@end
