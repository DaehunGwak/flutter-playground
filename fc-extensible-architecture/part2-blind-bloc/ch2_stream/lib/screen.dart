import 'dart:async';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final StreamController<List<ChatItem>> streamController = StreamController();
  final Stream<int> stream =
      Stream<int>.periodic(const Duration(seconds: 5), (count) => count)
          .take(5);
  final List<ChatItem> items = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoMessage();
    });
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  void startAutoMessage() {
    stream.listen((count) {
      if (count == 5) {
        return;
      }

      final String message;
      if (count == 0) {
        message = '채팅을 시작합니다.';
      } else if (count == 4) {
        message = '채팅을 종료합니다.';
      } else {
        message = '안녕하세요.' * count;
      }

      final ChatItem item = ChatItem(
        message: message,
        isMe: false,
      );

      items.add(item);
      streamController.sink.add(items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stream'),
      ),
      body: StreamBuilder<List<ChatItem>>(
        initialData: items,
        stream: streamController.stream,
        builder: (context, snapshot) {
          final List<ChatItem> items = snapshot.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final ChatItem item = items.reversed.toList()[index];
              if (item.isMe) {
                return ChatTile.right(
                  message: item.message,
                );
              } else {
                return ChatTile.left(
                  message: item.message,
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: items.length,
          );
        },
      ),
      bottomNavigationBar: ChatBottomNavigationBar(
        onSend: (message) {
          final ChatItem item = ChatItem(
            message: message,
          );

          items.add(item);
          streamController.sink.add(items);
        },
      ),
    );
  }
}

class ChatItem {
  final String message;
  final bool isMe;

  ChatItem({
    required this.message,
    this.isMe = true,
  });
}

class ChatTile extends StatelessWidget {
  final ChatItem item;

  const ChatTile({
    super.key,
    required this.item,
  });

  factory ChatTile.left({
    required String message,
  }) {
    return ChatTile(
      item: ChatItem(
        message: message,
        isMe: false,
      ),
    );
  }

  factory ChatTile.right({
    required String message,
  }) {
    return ChatTile(
      item: ChatItem(
        message: message,
        isMe: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          item.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (item.isMe) ...[
          const SizedBox(
            width: 80,
          ),
        ],
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: item.isMe ? Colors.blue : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 8.0,
              ),
              child: Text(
                item.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
        if (!item.isMe) ...[
          const SizedBox(
            width: 80,
          ),
        ],
      ],
    );
  }
}

class ChatBottomNavigationBar extends StatefulWidget {
  final Function(String) onSend;

  const ChatBottomNavigationBar({
    super.key,
    required this.onSend,
  });

  @override
  State<ChatBottomNavigationBar> createState() =>
      _ChatBottomNavigationBarState();
}

class _ChatBottomNavigationBarState extends State<ChatBottomNavigationBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.black.withOpacity(0.1),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewPaddingOf(context).bottom,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 8.0,
                      ),
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    final String message = controller.text;
                    widget.onSend.call(message);
                    controller.clear();
                  },
                  child: const Text('전송'),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
