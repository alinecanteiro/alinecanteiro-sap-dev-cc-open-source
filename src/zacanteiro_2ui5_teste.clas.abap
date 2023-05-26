class ZACANTEIRO_2UI5_TESTE definition
  public
  final
  create public .

public section.

  interfaces IF_SERIALIZABLE_OBJECT .
  interfaces Z2UI5_IF_APP .

  data USER type STRING .
  data DATE type STRING .
protected section.
private section.
ENDCLASS.



CLASS ZACANTEIRO_2UI5_TESTE IMPLEMENTATION.


  METHOD z2ui5_if_app~main.

    "event handling
    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ user } { date } - sent to the server| ).
    ENDCASE.

    "view rendering
    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
        )->page( title = 'SAP Developer Code Challenge – Open-Source ABAP (Week 2) - Aline'
            )->simple_form( title = 'Titulo' editable = abap_true
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'user'
                    )->input( client->_bind( user )
                    )->label( 'date'
                    )->date_picker( client->_bind( date )
                    )->button( text  = 'post' press = client->_event( 'BUTTON_POST' )
                    )->text( 'texto'
         )->get_root( )->xml_get( ) ) ).

  ENDMETHOD.
ENDCLASS.
