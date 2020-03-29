import 'dart:io';
String mock(String name) => File('test/mock/$name').readAsStringSync();