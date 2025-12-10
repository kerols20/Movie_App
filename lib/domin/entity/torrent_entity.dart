import 'package:equatable/equatable.dart';

class TorrentsEntity extends Equatable {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final String? isRepack;
  final String? videoCodec;
  final String? bitDepth;
  final String? audioChannels;
  final int? seeds;
  final int? peers;
  final String? size;
  final int? sizeBytes;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  const TorrentsEntity({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  @override
  List<Object?> get props => [
    url,
    hash,
    quality,
    type,
    isRepack,
    videoCodec,
    bitDepth,
    audioChannels,
    seeds,
    peers,
    size,
    sizeBytes,
    dateUploaded,
    dateUploadedUnix,
  ];
}
