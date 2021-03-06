Rails.application.routes.draw do



  get 'usuarios'                    => 'usuarios#index'

  get 'usuarios/:id'                => 'usuarios#mostrar' , as: :user

  put 'usuarios/:id'                  => 'usuarios#actualizar'


  get 'paginas/home'

  get 'pagina/home'


  devise_for :users


  post 'reportes/mostrar'

  get 'reportes/ver_reporte'

  get 'reportes'              => 'reportes#inicio'

  post 'reportes'                => 'reportes#crear'

  get 'reportes/index'


  get 'trayectos/crear'

  get 'trayectos'               =>'trayectos#index'

  get 'trayectos/inicio'

  get 'trayectos/actualizar'     =>'trayectos#actualizar'

  get 'trayectos/actualizar_duracion'

  get 'trayectos/mostrar'



  get 'prestamos'                  =>'prestamos#index'

  get 'prestamos/:id'              =>'prestamos#mostrar' , as: :prestamo



  post 'reservas/eliminar'

  get'reservas/index_all'

  get'reservas/inicio'

  post'reservas/eliminar'

  get 'reservas/asignar'             =>'reservas#asignar_reserva'

  get 'reservas/todas'             =>'reservas#index',as: :reservas

  post 'reservas/crear'            =>'reservas#crear_res'

  get 'reservas/mostrar'

  get 'reservas'                   =>'reservas#crear', as: :reserva



  get 'clientes/crear_reserva'     =>'clientes#crear_reserva'

  get 'clientes/reservas'          => 'clientes#ver_reservas'

  get 'clientes/inicio'

  get 'clientes/ingreso'           =>'clientes#ingreso_sesion'

  get 'clientes/signin'            => 'clientes#sign_in'

  post 'clientes'                  =>'clientes#crear'

  get 'clientes'                   => 'clientes#index'



  get 'estaciones/inicio'

  get 'estaciones'                 => 'estaciones#index'

  get 'estaciones/:id'             => 'estaciones#mostrar' , as: :estacion

  post 'estaciones'                => 'estaciones#crear'

  post 'estaciones/:id/registrar'  => 'estaciones#registrar' , as: :registrar_vcub

  post 'estaciones/:id/prestar'    => 'estaciones#prestar' , as: :prestar_vcub

  put 'estaciones/:id'             => 'estaciones#actualizar'

  delete 'estaciones/:id'          => 'estaciones#destruir'



  get 'emergencias/crear'

  get 'emergencias/:id'             => 'emergencias#mostrar'

  get 'emergencias'                 => 'emergencias#index'



  get 'vcubs/inicio'                => 'vcubs#inicio'

  get 'vcubs'                       => 'vcubs#index'

  post 'vcubs'                      => 'vcubs#crear'

  put 'vcubs/:id'                   => 'vcubs#actualizar'

  get 'vcubs/:id'                   => 'vcubs#mostrar' , as: :vcub

  delete 'vcubs/:id'                => 'vcubs#destruir'



  get 'tranvias/inicio'              => 'tranvias#inicio'

  get 'tranvias'                    => 'tranvias#index'

  post 'tranvias'                   => 'tranvias#crear'

  put 'tranvias/:id/'                => 'tranvias#actualizar'

  get 'tranvias/:id'                => 'tranvias#mostrar', as: :tranvia

  delete 'tranvias/:id'             => 'tranvias#destruir'

  post 'tranvias/:id/emergencia'     =>'tranvias#crear_emergencia', as: :reportar_emergencia


  get 'mobibuses/inicio'
  get 'mobibuses'                   => 'mobibuses#index'

  get 'mobibuses/:id'               => 'mobibuses#mostrar', as: :mobibus

  post 'mobibuses'                  => 'mobibuses#crear'

  put 'mobibuses/:id'               => 'mobibuses#actualizar'

  delete 'mobibuses/:id'            => 'mobibuses#destruir'



  get 'conductores/inicio'

  get 'conductores/calcular_puntaje'

  get 'conductores/asignar_transporte'


  get 'conductores'                 => 'conductores#index'

  post 'conductores'                => 'conductores#asignar_transportes1'

  get 'conductores/:id'             => 'conductores#mostrar'

  put 'conductores/:id'             => 'conductores#actualizar'

  delete 'conductores/:id'          => 'conductores#destruir'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'paginas#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end