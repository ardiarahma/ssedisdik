class DocumentsModel {
  final String documentId;
  final String documentName;
  final String documentFrom;
  final String documentCategory;
  final int documentCountTte;
  final String documentStatus;
  final String documentSize;
  final String documentCreatedAt;
  final String documentCreatedBy;
  final String documentUpdatedAt;
  
  DocumentsModel({
    required this.documentId,
    required this.documentName,
    required this.documentFrom,
    required this.documentCategory,
    required this.documentCountTte,
    required this.documentStatus,
    required this.documentSize,
    required this.documentCreatedAt,
    required this.documentCreatedBy,
    required this.documentUpdatedAt,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return DocumentsModel(
      documentId: json['document_id'],
      documentName: json['document_name'],
      documentFrom: json['document_from'],
      documentCategory: json['document_category'],
      documentCountTte: json['document_count_tte'],
      documentStatus: json['document_status'],
      documentSize: json['document_size'],
      documentCreatedAt: json['document_created_at'],
      documentCreatedBy: json['document_created_by'],
      documentUpdatedAt: json['document_updated_at'],
    );
  }
}
