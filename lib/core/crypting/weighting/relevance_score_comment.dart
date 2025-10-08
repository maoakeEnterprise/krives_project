import 'dart:math' as math;

class RelevanceScoreComment{
  static const int minLikes = 5;
  static const int maxLikes = 100;
  static const int minComments = 5;
  static const int maxComments = 100;
  static const double wLikes = 0.5;
  static const double wComments = 0.3;
  static const double wDate = 0.2;

  static double getNormsLikes(int likes){
    return (likes - minLikes) / (maxLikes - minLikes) ;
  }
  static double getNormsComments(int nbComments){
    return (nbComments - minComments) / (maxComments - minComments) ;
  }
  static double getRelevanceDate(DateTime date){
    return 1 / math.sqrt(DateTime.now().difference(date).inHours + 1);
  }
  static getRelevanceComment(int nbComments){
    return getNormsComments(nbComments) * wComments;
  }
  static getRelevanceLikes(int likes){
    return getNormsLikes(likes) * wLikes;
  }
  static getRelevanceScore(int likes, int nbComments, DateTime date){
    return getRelevanceDate(date) * wDate + (getRelevanceComment(nbComments) + getRelevanceLikes(likes)) * (wComments + wLikes);

  }
}