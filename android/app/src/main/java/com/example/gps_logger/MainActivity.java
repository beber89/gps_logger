package com.example.gps_logger;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.location.GnssStatus;
import android.location.LocationListener;
import android.location.Location;
import android.content.Context;
import android.location.LocationManager;
import android.location.GpsSatellite;

import android.Manifest;
import android.content.pm.PackageManager;
import android.app.Activity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.util.Iterator;

public class MainActivity extends FlutterActivity implements LocationListener {
  private static final String CHANNEL = "dom.com/gpsy";
  private LocationManager mLocationManager;
  private GnssStatus.Callback mGnssStatusCallback;
  private float satSnr = -1;
  private static final int INITIAL_REQUEST = 1337;
  private static final int LOCATION_REQUEST = INITIAL_REQUEST + 3;
  private static final String[] LOCATION_PERMS = { Manifest.permission.ACCESS_FINE_LOCATION };

  private boolean hasPermission(String perm) {
    return (PackageManager.PERMISSION_GRANTED == checkSelfPermission(perm));
  }

  private void doInitGpsy() {
    mLocationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
    mGnssStatusCallback = new GnssStatus.Callback() {
      @Override
      public void onSatelliteStatusChanged(GnssStatus status) {
        System.out.println("Callback");
        int count = status.getSatelliteCount();
        System.out.println(count);
        if (count >= 0) {
          satSnr = status.getCn0DbHz(count);
          System.out.println(satSnr);
        } else {
          satSnr = -10;
        }
      }
    };
    System.out.println("registering ... ");
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // TODO: LocationManager should register this callback
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("init")) {
          if (!hasPermission(Manifest.permission.ACCESS_FINE_LOCATION)) {
            requestPermissions(LOCATION_PERMS, LOCATION_REQUEST);
          } else {
            doInitGpsy();
            result.success(true);
          }
        } else if (call.method.equals("getSatellites")) {

          result.success(satSnr);
          // locationManager = (LocationManager)
          // getSystemService(Context.LOCATION_SERVICE);
          // Iterator<GpsSatellite> it =
          // locationManager.getGpsStatus(null).getSatellites().iterator();
          // System.out.println(locationManager.getGpsStatus(null));
          // int i = 0;
          // while(it.hasNext()) {
          // it.next();
          // i=i+1;
          // }
          // result.success(i);
        }
      }
    });
    GeneratedPluginRegistrant.registerWith(this);
  }

  @Override
    protected void onStart() {
        super.onStart();
        mLocationManager.registerGnssStatusCallback(mGnssStatusCallback);
        mLocationManager.requestLocationUpdates(
                LocationManager.GPS_PROVIDER, 30000, 0, this
        );
    }

    @Override
    protected void onStop() {
        mLocationManager.removeUpdates(this);
        mLocationManager.unregisterGnssStatusCallback(
                mGnssStatusCallback
        );
        super.onStop();
    }

    @Override
    public void onLocationChanged(Location location) {
    }

    @Override
    public void onStatusChanged(String provider, int status, 
            Bundle extras) {
    }

    @Override
    public void onProviderEnabled(String provider) {
    }

    @Override
    public void onProviderDisabled(String provider) {
    }
}
