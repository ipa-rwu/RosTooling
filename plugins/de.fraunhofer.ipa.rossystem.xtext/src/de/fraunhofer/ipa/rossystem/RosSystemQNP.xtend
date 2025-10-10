package de.fraunhofer.ipa.rossystem;

import org.eclipse.xtext.naming.DefaultDeclarativeQualifiedNameProvider;
import system.RosInterface;
import system.RosNode;
import org.eclipse.emf.ecore.EObject
import system.Rossystem
import system.System
import ros.Parameter
import system.RosParameter

class RosSystemQNP extends DefaultDeclarativeQualifiedNameProvider{


  override getFullyQualifiedName(EObject obj) {

    if (obj instanceof RosNode) {
      val node_name = obj.name
      return getConverter().toQualifiedName(node_name);
    }
    if (obj instanceof RosInterface) {
      // qualify interface names with their containing node: NodeName.InterfaceName
      val iface = obj as RosInterface
      val iface_name = iface.name
      val parent = iface.eContainer as RosNode
      if (parent !== null && parent.name !== null) {
        return getConverter().toQualifiedName(parent.name + "." + iface_name);
      }
      return getConverter().toQualifiedName(iface_name);
    }
    if (obj instanceof Rossystem) {
      val sys_name = obj.name
      return getConverter().toQualifiedName(sys_name);
    }
    if (obj instanceof System) {
      val sys_name = obj.name
      return getConverter().toQualifiedName(sys_name);
    }
    if (obj instanceof Parameter) {
      val param_name = obj.name
      return getConverter().toQualifiedName(param_name);
    }
    if (obj instanceof RosParameter) {
      // qualify ros parameters with their containing node: NodeName.ParamName
      val rparam = obj as RosParameter
      val param_name = rparam.name
      val parent = rparam.eContainer as RosNode
      if (parent !== null && parent.name !== null) {
        return getConverter().toQualifiedName(parent.name + "." + param_name);
      }
      return getConverter().toQualifiedName(param_name);
    }
    }

}
