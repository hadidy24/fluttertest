import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DataModels extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const DataModels({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory DataModels.fromJson(Map<String, dynamic> json) {
    debugPrint("fetching itemsv $json");
    return DataModels(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
