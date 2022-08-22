
import 'package:add_note/app/presenter/ui/add_note_page.dart';
import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core.dart';


class MicroAppAddNoteResolver implements MicroApp{
  
  @override
  String get microAppName => 'micro_app_add_note';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/add-note': ((context, args)=> AddNotePage())};
  }

}