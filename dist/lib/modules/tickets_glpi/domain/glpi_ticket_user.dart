enum VAtBUsgP4nOHQw {
  d80FdeRoE,
  sR0ySLVN,
  urioBbkp,
}

extension SJ4sjLGjZYEhPqE on VAtBUsgP4nOHQw {
  String get asString {
    switch (this) {
      case VAtBUsgP4nOHQw.d80FdeRoE:
        return 'requester';
      case VAtBUsgP4nOHQw.sR0ySLVN:
        return 'assignee';
      case VAtBUsgP4nOHQw.urioBbkp:
        return 'observer';
    }
  }
}

class N1UoL2JwYVelFG {
  final String iEMDwH;
  final VAtBUsgP4nOHQw mDjs;

  N1UoL2JwYVelFG({
    required this.iEMDwH,
    required this.mDjs,
  });

  Map<String, dynamic> qirj5T() => {
        'userId': iEMDwH,
        'role': mDjs.asString,
      };
}