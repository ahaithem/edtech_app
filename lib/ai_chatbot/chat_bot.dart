import 'package:edtech_app/constns/color_text_size.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'model_message.dart';
import '../widgets/app_bar.dart';

class GeminiChatBot extends StatefulWidget {
  const GeminiChatBot({super.key});

  @override
  State<GeminiChatBot> createState() => _GeminiChatBotState();
}

class _GeminiChatBotState extends State<GeminiChatBot> {
  TextEditingController promptController = TextEditingController();

  static const apiKey = "AIzaSyBeSuuaNVBVBmci8SzTP4dwN8qtPmcQLvU";
  final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);

  final List<ModelMessage> prompts = [];

  Future<void> sendMessage() async {
    final message = promptController.text;

    // for prompt
    setState(() {
      promptController.clear();
      prompts.add(
          ModelMessage(isPrompt: true, message: message, time: DateTime.now()));
    });

    //for respond
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      prompts.add(ModelMessage(
          isPrompt: false, message: response.text ?? "", time: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(title: 'ChatBot'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: prompts.length,
                    itemBuilder: (context, index) {
                      final message = prompts[index];
                      return userPrompt(
                          isPrompt: message.isPrompt,
                          message: message.message,
                          date: DateFormat('hh:mm a').format(message.time));
                    })),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: TextFormField(
                      controller: promptController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Ask something",
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: primary_color,
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container userPrompt(
      {required final bool isPrompt,
      required String message,
      required String date}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15)
          .copyWith(left: isPrompt ? 80 : 15, right: isPrompt ? 15 : 80),
      decoration: BoxDecoration(
          color: isPrompt ? success_color : border_color,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: isPrompt ? const Radius.circular(20) : Radius.zero,
              bottomRight: isPrompt ? Radius.zero : const Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // for prompt and respond
        Text(
          message,
          style: TextStyle(
              fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: isPrompt ? Colors.white : Colors.black),
        ),
        // for prompt and respond time
        Text(
          date,
          style: TextStyle(
              fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: isPrompt ? Colors.white : Colors.black),
        ),
      ]),
    );
  }
}
