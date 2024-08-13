class NiceImport < Formula
  desc "Sort and group import statements in local files to make the file headers look cleaner"
  homepage "https://github.com/tsaowe/nice-import"
  url "https://github.com/tsaowe/nice-import/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "48044d10aca6824e04a09805d34b7033252a56bb3a5ef8e117161d94dcd9dd5c"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.js").write <<~EOS
      import React from 'react';
      import { render } from 'react-dom';
      import { BrowserRouter as Router } from 'react-router-dom';
      import { App } from './App';
      import { config } from './config';
      import './styles.css';
      import { fetchData } from './api';
      import { useState } from 'react';
      import { Button } from '@material-ui/core';
    EOS
    system "#{bin}/nice-import", "test.js"
  end
end
