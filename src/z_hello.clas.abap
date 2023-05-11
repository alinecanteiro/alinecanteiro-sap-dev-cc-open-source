CLASS z_hello DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor
                IMPORTING
                  i_name TYPE char30.
    METHODS: display_message.

  PROTECTED SECTION.
  PRIVATE SECTION.
     DATA: name TYPE char30.
ENDCLASS.



CLASS z_hello IMPLEMENTATION.
  METHOD constructor.
    me->name = i_name.
  ENDMETHOD.                    "constructor

  METHOD display_message.
    WRITE: / 'Hello: ', name.
  ENDMETHOD.                    "display_message

ENDCLASS.
