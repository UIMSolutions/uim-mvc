module uim.mvc.interfaces.containerapplication;

// Interface for applications that configure and use a dependency injection container.
interface IContainerApplication {
  /**
    * Register services to the container
    *
    * Registered services can have instances fetched out of the container
    * using `get()`. Dependencies and parameters will be resolved based
    * on service definitions.
    *
    * @param uim.cake.Core\IContainer myContainer The container to add services to
    */
  /* void services(IContainer aContainer); */

  /**
    * Create a new container and register services.
    *
    * This will `register()` services provided by both the application
    * and any plugins if the application has plugin support.
    *
    * returns A populated container
    */
  /* IContainer createContainer(); */
}
