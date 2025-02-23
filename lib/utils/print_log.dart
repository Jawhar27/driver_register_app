import 'dart:developer';

bool isDev = true;

void printLogs(message) {
  if (isDev) {
    log(message.toString());
  }
}