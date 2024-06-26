// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals, unnecessary_this

class couponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  String? couponExpierdate;
  int? couponDiscount;

  couponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpierdate,
      this.couponDiscount});

  couponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpierdate = json['coupon_expierdate'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_expierdate'] = this.couponExpierdate;
    data['coupon_discount'] = this.couponDiscount;
    return data;
  }
}
