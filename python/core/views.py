from django.shortcuts import render
from .models import Configuracoes
from django.contrib.auth.decorators import login_required, user_passes_test


@login_required(redirect_field_name='next')
@user_passes_test(lambda u: u.has_perm('configuracoes.index'))
def configuracoes(request, user):
    if request.method == 'GET':
        template_name = 'Configuracoes/index.html'
        context = {
            'users_g6': [],
        }
        for x in Configuracoes.objects.all().filter(usuario_id=user):
            context[x.registro] = x.valor

        for x in Configuracoes.get_users_g6():
            x['id'] = str(x['_id'])
            context['users_g6'].append(x)
        return render(request, template_name, context)

    if request.method == 'POST':
        context = {}
        template_name = 'Configuracoes/index.html'
        if request.POST.get('user_id_g6'):
            user_id_g6 = Configuracoes.objects.all().filter(
                usuario_id=user,
                registro='user_id_g6'
            )
            user_id_g6_1 = Configuracoes.objects.all().filter(
                registro='user_id_g6',
                valor=request.POST.get('user_id_g6')
            )
            if len(user_id_g6) == 0 and len(user_id_g6_1) == 0:
                Configuracoes.objects.create(
                    usuario_id=user,
                    registro='user_id_g6',
                    valor=request.POST.get('user_id_g6')
                )
            elif len(user_id_g6) > 0 and len(user_id_g6_1) == 0 and user_id_g6.valor != request.POST.get('user_id_g6'):
                user_id_g6[0].valor = request.POST.get('user_id_g6')
                user_id_g6[0].save()

        data_table_search = Configuracoes.objects.all().filter(
            usuario_id=user,
            registro='data_table_search'
        )
        if len(data_table_search) == 0:
            Configuracoes.objects.create(
                usuario_id=user,
                registro='data_table_search',
                valor='On' if request.POST.get('data_table_search') == 'on' else 'Off'
            )
        else:
            data_table_search_valor = 'On' if request.POST.get('data_table_search') == 'on' else 'Off'
            if data_table_search_valor != data_table_search[0].valor:
                data_table_search[0].valor = data_table_search_valor
                data_table_search[0].save()
        return render(request, template_name, context)
