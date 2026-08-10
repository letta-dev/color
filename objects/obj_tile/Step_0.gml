/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
switch (estado)
{

    //---------------------------------
    // SEGUE O MOUSE
    //---------------------------------

    case "movel":

        x = mouse_x;
        y = mouse_y;

    break;


		//---------------------------------
		// PREPARA A JOGADA
		//---------------------------------

		case "prepara":

		    image_xscale = 0.9;
		    image_yscale = 0.9;

		    board_destino = instance_nearest(mouse_x, mouse_y, obj_board);

		    if (board_destino != noone)
		    {
		        var distancia = point_distance(
		            mouse_x,
		            mouse_y,
		            board_destino.x,
		            board_destino.y
		        );

		        //----------------------------------
		        // TILE NORMAL
		        //----------------------------------

		        if (tipo == obj_controle.TIPO_TILE)
		        {
		            if (distancia < 30 && scr_board_valido(board_destino, id))
		            {
		                x = board_destino.x;
		                y = board_destino.y;

		                //----------------------------------
		                // PREVIEW DA COMBINAÇÃO
		                //----------------------------------

		                board_destino.tile = id;
		                board_destino.ocupado = true;

		                scr_buscar_cadeia(board_destino);
		                scr_verificar_combinacao();
		                scr_atualizar_preview();

		                board_destino.tile = noone;
		                board_destino.ocupado = false;
		            }
		            else
		            {
		                x = mouse_x;
		                y = mouse_y;

		                board_destino = noone;

		                with (obj_tile)
		                {
		                    preview = false;
		                }
		            }
		        }

		        //----------------------------------
		        // MOVER
		        //----------------------------------

		        else
		        {
		            if (distancia < 30 && board_destino.ocupado)
		            {
		                x = board_destino.x;
		                y = board_destino.y;
		            }
		            else
		            {
		                x = mouse_x;
		                y = mouse_y;

		                board_destino = noone;
		            }

		            // O mover nunca possui preview
		            with (obj_tile)
		            {
		                preview = false;
		            }
		        }
		    }

		break;


    //---------------------------------
    // PEÇA CONFIRMADA
    //---------------------------------

    case "final":

        image_xscale = preview ? 0.9 : 1;
        image_yscale = preview ? 0.9 : 1;

    break;

}



if (destruindo)
{
    escala -= 0.05;          // diminui o tamanho
    image_angle += 10;       // gira o sprite
    image_xscale = escala;
    image_yscale = escala;

    if (escala <= 0)
    {
        instance_destroy();
    }
}

