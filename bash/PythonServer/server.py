from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

# Define the HTTP request handler class
class MyHTTPRequestHandler(BaseHTTPRequestHandler):
    
    # Handle GET requests
    def do_GET(self):
        self.send_response(200)  # HTTP status OK
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        
        # Get hostname and IP address of the server
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)
        
        # Construct the response content
        response_content = f"Server Hostname: {hostname}\nServer IP Address: {ip_address}\nThis is the response.\n"
        
        # Send the response
        self.wfile.write(response_content.encode('utf-8'))

# Define the main function to start the server
def run(server_class=HTTPServer, handler_class=MyHTTPRequestHandler, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()

# Run the server
if __name__ == '__main__':
    run()

