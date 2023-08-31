class DocumentResult {
  final String documentId;
  final String documentName;
  final String documentFrom;
  final String documentCategory;
  final int documentCountTte;
  final String documentStatusTte;
  final String documentStatus;
  final String documentSize;
  final String documentCreatedAt;
  final String documentCreatedBy;
  final String documentUpdatedAt;
  final String documentUpdatedBy;
  final List<FileData> file;
  final List<EsignData> esign;

  DocumentResult({
    required this.documentId,
    required this.documentName,
    required this.documentFrom,
    required this.documentCategory,
    required this.documentCountTte,
    required this.documentStatusTte,
    required this.documentStatus,
    required this.documentSize,
    required this.documentCreatedAt,
    required this.documentCreatedBy,
    required this.documentUpdatedAt,
    required this.documentUpdatedBy,
    required this.file,
    required this.esign,
  });

  factory DocumentResult.fromJson(Map<String, dynamic> json) {
    // Parsing the 'file' list
    final List<dynamic> fileData = json['file'];
    final List<FileData> files =
        fileData.map((fileJson) => FileData.fromJson(fileJson)).toList();

    // Parsing the 'esign' list
    final List<dynamic> esignData = json['esign'];
    final List<EsignData> esigns =
        esignData.map((esignJson) => EsignData.fromJson(esignJson)).toList();

    return DocumentResult(
      documentId: json['document_id'],
      documentName: json['document_name'],
      documentFrom: json['document_from'],
      documentCategory: json['document_category'],
      documentCountTte: json['document_count_tte'],
      documentStatusTte: json['document_status_tte'],
      documentStatus: json['document_status'],
      documentSize: json['document_size'],
      documentCreatedAt: json['document_created_at'],
      documentCreatedBy: json['document_created_by'],
      documentUpdatedAt: json['document_updated_at'],
      documentUpdatedBy: json['document_updated_by'],
      file: files,
      esign: esigns,
    );
  }
}

class FileData {
  final String fileName;
  final String fileUrl;
  final String fileUploadedAt;
  final String fileSignedAt;

  FileData({
    required this.fileName,
    required this.fileUrl,
    required this.fileUploadedAt,
    required this.fileSignedAt,
  });

  factory FileData.fromJson(Map<String, dynamic> json) {
    return FileData(
      fileName: json['file_name'],
      fileUrl: json['file_url'],
      fileUploadedAt: json['file_uploaded_at'],
      fileSignedAt: json['file_signed_at'],
    );
  }
}

class EsignData {
  final int page;
  final String tag;
  final String position;
  final String sendToGroup;
  final String sendToPerson;
  final String statusTte;
  final String status;
  final int order;

  EsignData({
    required this.page,
    required this.tag,
    required this.position,
    required this.sendToGroup,
    required this.sendToPerson,
    required this.statusTte,
    required this.status,
    required this.order,
  });

  factory EsignData.fromJson(Map<String, dynamic> json) {
    return EsignData(
      page: json['page'],
      tag: json['tag'],
      position: json['position'],
      sendToGroup: json['send_to_group'],
      sendToPerson: json['send_to_person'],
      statusTte: json['status_tte'],
      status: json['status'],
      order: json['order'],
    );
  }
}
