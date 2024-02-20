part of orders;

class ImportByJsonButton extends StatelessWidget {
  const ImportByJsonButton({
    super.key,
    required this.onImport,
  });

  final void Function(String jsonText) onImport;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await _buildDialog(context);
        if(result != null) {
          onImport.call(result);
        }
      },
      child: const Text(
        'Import from json',
      ),
    );
  }

  Future<String?> _buildDialog(BuildContext context) {
    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return const ImportJsonDialog();
      },
    );
  }
}

class ImportJsonErrorDialog extends StatelessWidget {
  const ImportJsonErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import from POS Json'),
      content: const Text(
        'The JSON is invalid or you are trying to add an order that already exists!',
      ),
      actions: <Widget>[

        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

}


class ImportJsonDialog extends StatefulWidget {
  const ImportJsonDialog({
    super.key,
  });

  @override
  State<ImportJsonDialog> createState() => _ImportJsonDialogState();
}

class _ImportJsonDialogState extends State<ImportJsonDialog> {
  final TextEditingController _jsonTextController = TextEditingController();

  @override
  void dispose() {
    _jsonTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import from POS Json'),
      content: SizedBox(
        width: 600,
        child: TextFormField(
          controller: _jsonTextController,
          maxLines: 50,
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Import'),
          onPressed: () {
            Navigator.of(context).pop(_jsonTextController.text);
          },
        ),
      ],
    );
  }
}
