/*
 * Copyright 2007 (c) Tim Knip, ascollada.org.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
 
package org.ascollada.core
{
	import org.ascollada.namespaces.*;
	
	/**
	 * @author Tim Knip
	 */
	public class ColladaController extends ColladaElement
	{
		use namespace collada;
		
		public var skin:ColladaSkin;
		
		public var morph:ColladaMorph;
		
		/**
		 * 
		 */ 
		public function ColladaController(node:XML=null)
		{
			super(node);
		}
		
		/**
		 * Parses the XML node.
		 * 
		 * @param	node	The node to parse.
		 */ 
		override public function parse(node:XML):void
		{
			if(String(node.localName()) != "controller")
				throw new Error("Not a COLLADA 'controller' element!");	
				
			super.parse(node);
			
			var skinNode:XML = node.skin[0];
			var morphNode:XML = node.morph[0];
			
			if(skinNode)
			{
				this.skin = new ColladaSkin(skinNode);
			}
			else if(morphNode)
			{
				this.morph = new ColladaMorph(morphNode);
			}
			else
			{
				throw new Error("Controller needs one of <skin> or <morph> elements!");
			}
		}
	}
}